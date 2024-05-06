import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/shop/food/components/food_store_display_card_one.dart';

class AllFoodStoreScreen extends StatefulWidget {
  const AllFoodStoreScreen({super.key});

  @override
  State<AllFoodStoreScreen> createState() => _AllFoodStoreScreenState();
}

class _AllFoodStoreScreenState extends State<AllFoodStoreScreen> {
  final searchFoodStoreController = TextEditingController();
  List recipeRatingData = [
    "4.5",
    "2.0",
    "5.0",
    "4.5",
    "3.0",
    "2.5",
    "4.0",
  ];
  List recipeTitle = [
    "Nova Store",
    "Diamond Foods",
    "Roban",
    "Vegas",
    "Chicken Repub",
    "sample store",
    "sample store 2",
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
  List restLocation = [
    "ofa road 11",
    "tamaje bloc 5",
    "water works",
    "25 hiltop road",
    "Bayan stadium",
    "sample location",
    "sample location",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Stores"),
        centerTitle: true,
        actions: [
        ],
      ),
      body: Column(
        children: [
          SearchSpace(controller: searchFoodStoreController, prefixIcon: const Icon(IconlyLight.search, color: Colors.grey,), hintText: "search stores"),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9, crossAxisSpacing: 2, mainAxisSpacing: 10),
              itemCount: restaurantImage.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodStoreDisplayCardOne(restaurantImage: restaurantImage[Random().nextInt(restaurantImage.length)], restaurantLocation: restLocation[Random().nextInt(restLocation.length)], restaurantRatingData: recipeRatingData[Random().nextInt(recipeRatingData.length)], restaurantName: recipeTitle[Random().nextInt(recipeTitle.length)],);
              },
            ),
          ),
        ],
      ),
    );
  }
}
