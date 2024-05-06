import 'package:flutter/material.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/product_list_style.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/add_product_screen.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/product_deleted_success_screen.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/store_collections_list_screen.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/update_product_screen.dart';
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';
import 'package:nova_mobile/utilities/custom_loader_overlay.dart';

class StoreProductsScreen extends StatefulWidget {
  const StoreProductsScreen({super.key});

  @override
  State<StoreProductsScreen> createState() => _StoreProductsScreenState();
}

class _StoreProductsScreenState extends State<StoreProductsScreen> {
  late Future<List<Product>> _futureProducts;
  final storeManagerService = StoreManagerService();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _futureProducts = storeManagerService.fetchMyStoreProducts();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _futureProducts = storeManagerService.fetchMyStoreProducts();
    });
  }

  Future<void> _deleteProduct(Product product) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await storeManagerService.deleteProduct(context: context, product: product);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductDeletedSuccessScreen()));
      _refreshProducts();
    } catch (err) {
      setState(() {
        _isLoading = true;
      });
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Store Products"),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.blue[800],
                      labelColor: Colors.blue[800],
                      unselectedLabelColor: Colors.grey,
                      dividerHeight: 0,
                      tabs: const [
                        Tab(
                          text: "Products",
                        ),
                        Tab(
                          text: "Collections",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //products
                          RefreshIndicator(
                            onRefresh: _refreshProducts,
                            child: FutureBuilder<List<Product>>(
                              future: _futureProducts,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CustomLoader());
                                } else if (snapshot.hasError) {
                                  return const Center(child: Text("Unable to load data"));
                                } else {
                                  List<Product> products = snapshot.data ?? [];
                                  return ListView.builder(
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      Product product = products[index];
                                      return ProductListStyle(
                                        productName: product.name,
                                        productPrice: product.price.toString(),
                                        productImage: product.image,
                                        productQuantity: product.quantityOfProduct.toString(),
                                        onEditPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => EditProductScreen(product: product, productID: product.id,),
                                          ));
                                        },
                                        onDeletePressed: () {
                                          _deleteProduct(product);
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),

                          //collections
                          StoreCollectionsListScreen()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddProductScreen()));
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add, color: Colors.white,),
              ),
            ),
            if (_isLoading) const CustomLoaderOverlay(),
          ],
        ),
      ),
    );
  }
}
