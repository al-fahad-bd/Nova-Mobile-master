import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/components/category_style.dart';
import 'package:nova_mobile/features/shop/components/filter_bottom_sheet.dart';
import 'package:nova_mobile/features/shop/components/product_style.dart';
import 'package:nova_mobile/features/shop/components/sub_category_style.dart';
import 'package:nova_mobile/features/shop/food/screens/all_food_store_screen.dart';
import 'package:nova_mobile/features/shop/screens/product_filter_screen.dart';
import 'package:nova_mobile/features/shop/screens/shop_search_screen.dart';
import 'package:nova_mobile/features/shop/screens/stores_screen.dart';
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/services/product_services.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final ProductServices productServices = ProductServices();
  late Future<List<Product>> _futureProducts;
  @override
  void initState() {
    super.initState();
    _futureProducts = productServices.getAllProducts(context);
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _futureProducts = productServices.getAllProducts(context);
    });
  }


  String failedMessage = "Unable to load products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" All Products"),
        actions: [
          //Search
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShopSearchScreen()));
              },
              icon: const Icon(IconlyLight.search)),
          //Cart
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(IconlyLight.bag)),
          //product filter
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductFilterScreen()));
              },
              icon: const Icon(Icons.menu)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        color: Colors.blue,
        child: FutureBuilder<List<Product>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomLoader());
            } else if (snapshot.hasError) {
              return Center(child: Text(failedMessage));
            } else {
              List<Product> products = snapshot.data ?? [];
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.60, // Adjust this aspect ratio according to your layout preference
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return ProductStyle(
                    productImage: product.image,
                    name: product.name,
                    description: product.description,
                    productPrice: product.price.toString(),
                    productCategory: product.categoryName,
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllFoodStoreScreen()));
        },
        backgroundColor: Colors.blue,
        clipBehavior: Clip.antiAlias,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        child: const Icon(IconlyLight.home, color: Colors.white,),
      )
    );
  }
}
