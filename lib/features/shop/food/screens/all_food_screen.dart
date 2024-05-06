import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/food/components/food_card_style.dart';

class AllFoodScreen extends StatefulWidget {
  const AllFoodScreen({super.key});

  @override
  State<AllFoodScreen> createState() => _AllFoodScreenState();
}

class _AllFoodScreenState extends State<AllFoodScreen> {
  final searchAllFoodScreen = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Foods"),
        actions: [
          //cart
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
              },
              icon: const Icon(IconlyLight.bag)),
        ],
      ),
      body: Column(
        children: [
          SearchSpace(controller: searchAllFoodScreen, prefixIcon: const Icon(IconlyLight.search, color: Colors.grey,), hintText: "search food, groceries, drinks"),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.7, crossAxisSpacing: 1, mainAxisSpacing: 10),
              itemCount: foodImg.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodCardStyle(foodImage: foodImg[Random().nextInt(foodImg.length)]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
