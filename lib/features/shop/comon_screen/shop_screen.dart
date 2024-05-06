import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/components/brand_category.dart';
import 'package:nova_mobile/features/shop/components/designer_collections.dart';
import 'package:nova_mobile/features/shop/components/looks_of_the_day.dart';
import 'package:nova_mobile/features/shop/components/product_style.dart';
import 'package:nova_mobile/features/shop/components/quick_adds.dart';
import 'package:nova_mobile/features/shop/components/shop_banner.dart';
import 'package:nova_mobile/features/shop/components/weekly_highlight.dart';
import 'package:nova_mobile/features/shop/food/components/food_advert_container.dart';
import 'package:nova_mobile/features/shop/food/components/food_card_style.dart';
import 'package:nova_mobile/features/shop/food/components/food_category_style.dart';
import 'package:nova_mobile/features/shop/food/components/food_store_display_card_one.dart';
import 'package:nova_mobile/features/shop/food/components/recipe_card.dart';
import 'package:nova_mobile/features/shop/food/screens/all_food_screen.dart';
import 'package:nova_mobile/features/shop/food/screens/all_food_store_screen.dart';
import 'package:nova_mobile/features/shop/food/screens/food_notification_screen.dart';
import 'package:nova_mobile/features/shop/screens/all_collections_screen.dart';
import 'package:nova_mobile/features/shop/screens/all_products_screen.dart';
import 'package:nova_mobile/features/shop/screens/product_filter_screen.dart';
import 'package:nova_mobile/features/shop/screens/shop_search_screen.dart';
import 'package:nova_mobile/features/shop/screens/stores_screen.dart';
import 'package:nova_mobile/features/shop/screens/wish_list_screen.dart';
import 'package:nova_mobile/features/socials/screens/user_profile_screen.dart';
import 'package:nova_mobile/services/product_services.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';

import '../../../model/product_model.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin {
  final ProductServices productServices = ProductServices();
  late Future<List<Product>> _futureProducts;

  String failedMessage = "Unable to load products";

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
  List chefNames = [
    "Naila",
    "Habib",
    "Mufti",
    "Khalifa",
    "SUSO",
    "Blessing",
    "Amanda",
    "Ada",
  ];
  List collectionImage = [
    "banner_img.jpg",
    "0d2f2ec31a05794c70a26b024403de32.jpg",
    "0d2569fa15d54f392b77c48adfc46d68.jpg",
    "1d56fd8f283eb1e045da26a9537037bf.jpg",
    "3ff399c96cbe2f2b511e78a4b89a18a8.jpg",
    "03e6048301cf0310e5ce1d466b56cadc.jpg",
    "4aa7dda11b76d7d3ae5059939f90c0ee.jpg",
    "04e548504925a0428546eefdaf2e1a9b.jpg",
    "5afe6382eecfc215fd57db61a3702574.jpg",
    "9e3b173a2a184c90908cc6bfa7d8ee5c.jpg",
    "13a23e8752178bbd35d705025b915536.jpg",
    "15e98995ea6b704d7884acb726352628.jpg",
    "16c655d742ef34b52f1a72223fcd9e08.jpg",
    "50f6e37d70868ad21985a85d947b5a0a.jpg",
    "68ff50ac20e12c73e0d8939b21776749.jpg",
    "82c067cffdd72e5d0326dd37bb24d52e.jpg",
    "0086ab87ae68c0bc24956c8ec39dc92a.jpg",
    "158d8b2740837e25981683b8719a5fce.jpg",
    "381c13c6afe32d6f6a5ce00330e5148a.jpg",
    "392aec1ca20a9f43e482d1971a0620b6.jpg",
    "465dec7678d42a691907ede78c146f7a.jpg",
    "471fb3003a8d1a75c21998a17b1b5eb8.jpg",
    "483df3413d4c3ede89f4b33459586055.jpg",
    "483e2ed2d8b5b175c82dddc6c328a258.jpg",
    "931ec9006cd98de505e8469d30a8dfa1.jpg",
    "944f20b295393c65483106b08a44c7b6.jpg",
    "982e870643de934c77bb35216d48ce77.jpg",
    "2337ca3973d0b8850c590f84c3af8153.jpg",
    "2644ed706b28c552f7637a0bd62b9cba.jpg",
    "5581da6f4a07d52a01113b40fac24081.jpg",
    "7898e2ee752aff4dc619974d1ac8f63f.jpg",
    "040299abd7103354c3c02ce52f5668a2.jpg",
    "288650f9b44ca5117fbf752be47c5b67.jpg",
    "357567ef0ee82f00e409a39ec27ddeb2.jpg",
    "73251673b5bffb8ff501d396725441eb.jpg",
    "211202959a5d2b87ac7951d3233d4bed.jpg",
    "0454218032f91dc89f346f95552f3222.jpg",
    "840882234e104cc71eb3a70f2213e5cc.jpg",
    "4536390552c55a67cf2dd5b9c31a6213.jpg",
    "a15ebdf1304af8c9527d5b49339d9e28.jpg",
    "a015bd039d4c32f8bdce1532b1b0e016.jpg",
    "a98c4c8e3e2826398899c3b79349bec9.jpg",
    "a2334bd13f42e11efb22ea4ec4ab528e.jpg",
    "b2ed3b33e125b9bf65d415c8617bce37.jpg",
    "b44c09f56d4ab35a9369c1d1a65fed86.jpg",
    "b64ea11f8bbbe4725ec8c7d4e2b1c828.jpg",
    "ba6a081b2a989593600fdaad28b5524f.jpg",
    "bc5a1ad76e6f7d385a73beec19e113ee.jpg",
    "bc673beb5735589a7ff6669f744efdfd.jpg",
    "bf1ecd92a7cabe26caba0b94e95a39a0.jpg",
    "c4ac78d0cbe5cc420590fcbc58df9938.jpg",
    "c760f4826473e242ae231562f6957a9c.jpg",
    "cba9ac5d9fca3ea81f835badc26526dc.jpg",
    "cce24929d3c537605ccc5551f08b91e0.jpg",
    "d3e7e3d635aeae5f0e6ccea5b7787fc0.jpg",
    "d15c5dc07c222af53b5dfb066de6a836.jpg",
    "dcc8c213b695b640c3db17369213ef57.jpg",
    "e2b9f2f69d15ca0017e062242124f40a.jpg",
    "e6b62bb9adcffc1c645f1603c05e429c.jpg",
    "e6f0fa4b12e6303ac29448a4891e0db6.jpg",
    "e054f64620059eba26d4cd4047e29d93.jpg",
    "e91ce6b22a8a6652ee80fce45aabb41a.jpg",
    "e962065c51c5b27e7930992e9e150f02.jpg",
    "ec127ab997e4f663b401a022c365a41a.jpg",
    "ed7d8733b9305182684c865df2b13008.jpg",
    "f809360776fecf2d7bf7ffb3ad243a5b.jpg",
    "fab55b36e6195a8d82bdda0e8a28be22.jpg",
    "fd6dac2752e51769b052df23decba4c0.jpg",
  ];
  List chefImages = [
    "banner_img.jpg",
    "banner_img2.jpg",
    "8925d18fdf86b1882e29c95795e22c8b.jpg",
    "b1600b135981cbf4f2b6e414a7410d68.jpg",
    "249432c2547621906c9b25771d06318d.jpg",
    "c173b7a22fbf1a195ebddc43b671c778.jpg",
    "banner_img4.jpg",
    "f0d47af5192a592dcf1bdf54fb8fade8.jpg",
  ];
  List recipeImage = [
    "sample_food.jpg",
    "sample_food2.jpg",
    "sample_food12.jpg",
    "sample_food22.jpg",
    "sample_food20.jpg",
    "sample_food32.jpg",
    "sample_food25.jpg",
  ];
  List recipeTitle = [
    "Tomato Pasta",
    "Fried rice",
    "Egg Pasta",
    "Lemon Chicken",
    "Mash Potatoes",
    "Jollof Spag",
    "Chicken & Chips",
  ];
  List recipeAuthor = [
    "Laura Andrew",
    "Gold andrew",
    "Emmanuella John",
    "Beauty",
    "John does",
    "Habiba Usman",
    "Nafeesa Ibrahim",
  ];
  List restLocation = [
    "177 avenue bloc5",
    "20 hiltop road",
    "5 water works road bloc 9",
    "Kpiri Kipiri",
    "Nakarasi Ardo",
    "Dandima bustop road",
    "unknown location 4",
  ];
  List recipeTime = [
    "35",
    "40",
    "20",
    "30",
    "1:40",
    "45",
    "1:00",
  ];
  List recipeRatingData = [
    "4.5",
    "5.0",
    "3.0",
    "2.5",
    "4.0",
    "5.0",
    "3.5",
  ];
  List foodImg = [
    "sample_food36.jpg",
    "sample_food37.jpg",
    "sample_food38.jpg",
    "sample_food39.jpg",
    "sample_food40.jpg",
    "sample_food41.jpg",
    "sample_food.jpg",
    "sample_food2.jpg",
    "sample_food35.jpg",
    "sample_food34.jpg",
    "sample_food33.jpg",
    "sample_food32.jpg",
    "sample_food31.jpg",
    "sample_food20.jpg",
    "sample_food29.jpg",
    "sample_food28.jpg",
    "sample_food3.jpg",
    "sample_food4.jpg",
    "sample_food5.jpg",
    "sample_food6.jpg",
    "sample_food18.jpg",
    "sample_food20.jpg",
    "sample_food21.jpg",
    "sample_food22.jpg",
    "sample_food23.jpg",
    "sample_food24.jpg",
    "sample_food7.jpg",
    "sample_food27.jpg",
    "sample_food26.jpg",
    "sample_food25.jpg",
    "sample_food8.jpg",
    "sample_food9.jpg",
    "sample_food10.jpg",
    "sample_food11.jpg",
    "sample_food12.jpg",
    "sample_food13.jpg",
    "sample_food14.jpg",
    "sample_food15.jpg",
    "sample_food16.jpg",
    "sample_food17.jpg",
    "sample_food18.jpg",
  ];
  List restaurantImage = [
    "sample_rest1.jpg",
    "sample_rest2.jpg",
    "sample_rest3.jpg",
    "sample_rest4.jpg",
    "sample_rest5.jpg",
    "sample_rest6.jpg",
    "sample_rest7.jpg",
  ];
  int recipeIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChange(int index) {
    setState(() {
      recipeIndex = index;
    });
  }

  //weekly highlight
  final weeklyHighlight = [
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
    WeeklyHighlight(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: _refreshProducts,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                //search
                // IconButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopSearchScreen()));
                //     },
                //     icon: const Icon(IconlyLight.search)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FoodNotificationScreen()));
                    },
                    icon: const Icon(IconlyLight.notification)),

                //wish list
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WishListScreen()));
                    },
                    icon: const Icon(IconlyLight.heart)),
                //Stores
                // IconButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => const StoresScreen()));
                //     },
                //     icon: const Icon(IconlyLight.home)),

                //cart
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    icon: const Icon(IconlyLight.bag)),
              ],
              leading: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductFilterScreen()));
                    });
                  },
                  icon: const Icon(IconlyBroken.filter)),
              expandedHeight: 400,
              centerTitle: true,
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: SizedBox(
                  child: ShopBanner(),
                ),
                title: Text(
                  "Market Place",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          "Mega sales discount on all item up to 30%",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //top chefs
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Chef's",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "see all",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              )
                            ],
                          ),
                          const Text(
                            "check out the top most rated chef's",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: chefNames.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return TitledCircleImage(
                                  imageHeight: 60,
                                  imageWidth: 60,
                                  image: chefImages[index],
                                  imageTitle: chefNames[index],
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => UserProfileScreen(
                                          userProfilePicture: chefImages[index],
                                          userNameOfUser: chefNames[index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          //designer collections
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Designer Collection",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllCollectionScreen()));
                                },
                                child: const Text(
                                  "more",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              itemCount: collectionImage.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return DesignerCollections(
                                  productImage: collectionImage[
                                      Random().nextInt(collectionImage.length)],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //today's spacial
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Today's Spacial",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllFoodScreen()));
                                },
                                child: const Text(
                                  "see all",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 165,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: foodImg.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return FoodCardStyle(
                                    foodImage: foodImg[
                                        Random().nextInt(foodImg.length)]);
                              },
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Brands",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const BrandCategory(),
                          //food quick advert
                          const FoodAvertContainer(),
                          const SizedBox(
                            height: 10,
                          ),
                          //featured product
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Featured Product",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllProductScreen()));
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 195,
                            child: FutureBuilder<List<Product>>(
                              future: _futureProducts,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: CustomLoader(),);
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(failedMessage));
                                } else {
                                  List<Product> products = snapshot.data ?? [];
                                  return ListView.builder(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
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
                          //groceries
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Groceries",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllFoodScreen()));
                                },
                                child: const Text(
                                  "see all",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 165,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: foodImg.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return FoodCardStyle(
                                    foodImage: foodImg[
                                        Random().nextInt(foodImg.length)]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const QuickAdds(),
                          const SizedBox(
                            height: 10,
                          ),
                          //category
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "see all",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              )
                            ],
                          ),
                          const SizedBox(height: 80, child: FoodCategoryStyle()),
                          const SizedBox(
                            height: 15,
                          ),
                          //Editors pick
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Editor's Pick",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const AllProductScreen()));
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 195,
                            child: FutureBuilder<List<Product>>(
                              future: _futureProducts,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: CustomLoader(),);
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(failedMessage));
                                } else {
                                  List<Product> products = snapshot.data ?? [];
                                  return ListView.builder(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
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
                          const SizedBox(
                            height: 20,
                          ),
                          //popular food
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Popular Food",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllFoodScreen()));
                                },
                                child: const Text(
                                  "see all",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 165,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: foodImg.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return FoodCardStyle(
                                    foodImage: foodImg[
                                        Random().nextInt(foodImg.length)]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //recipe's
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Recipe's",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "see all",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: PageView.builder(
                              itemCount: recipeAuthor.length,
                              controller: _pageController,
                              onPageChanged: onPageChange,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return RecipeCard(
                                    recipeImage: recipeImage[index],
                                    recipeTitle: recipeTitle[index],
                                    recipeTime: recipeTime[index],
                                    recipeAuthor: recipeAuthor[index],
                                    recipeRatingData: recipeRatingData[index]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < recipeImage.length; i++)
                                if (recipeIndex == i)
                                  const DotIndicator(isActive: true)
                                else
                                  const DotIndicator(isActive: false)
                            ],
                          ),
                          //fashion highlight
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "This Week's Highlight",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Brows most popular looks this week",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: weeklyHighlight.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return const WeeklyHighlight();
                              },
                            ),
                          ),

                          //trending now
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trending Now",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Daily from the world's best brands and\nboutiques ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const AllProductScreen()));
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 195,
                            child: FutureBuilder<List<Product>>(
                              future: _futureProducts,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: CustomLoader(),);
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(failedMessage));
                                } else {
                                  List<Product> products = snapshot.data ?? [];
                                  return ListView.builder(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
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
                          const SizedBox(
                            height: 20,
                          ),
                          //Available restaurant
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Available Store",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllFoodStoreScreen()));
                                },
                                child: const Text(
                                  "see all",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 210,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: restaurantImage.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return FoodStoreDisplayCardOne(
                                  restaurantImage: restaurantImage[
                                      Random().nextInt(restaurantImage.length)],
                                  restaurantLocation: restLocation[
                                      Random().nextInt(restLocation.length)],
                                  restaurantRatingData: recipeRatingData[
                                      Random().nextInt(recipeRatingData.length)],
                                  restaurantName: recipeTitle[
                                      Random().nextInt(recipeTitle.length)],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //nova looks of the day
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "#NovaLooksOfTheDay",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Share your looks with us with hash-tag",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                          SafeArea(
                            child: SizedBox(
                                height: 350,
                                child: Stack(
                                  children: [
                                    const LooksOfTheDay(),
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.grey.withOpacity(0.0),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
