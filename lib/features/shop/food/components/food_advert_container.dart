import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';

class FoodAvertContainer extends StatefulWidget {
  const FoodAvertContainer({super.key});

  @override
  State<FoodAvertContainer> createState() => _FoodAvertContainerState();
}

class _FoodAvertContainerState extends State<FoodAvertContainer> {
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
    return Container(
      height: 140,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.grey[200]
      ),
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("images/${foodImg[Random().nextInt(foodImg.length)]}", fit: BoxFit.cover),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Get a 20% discount on your first \nlocal food order",
                  style: TextStyle(
                      color: Colors.grey[300]
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                    child: ShopButtons(title: "Order Now", bgColor: Colors.white, textColor: Colors.black, onTap: (){})),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
