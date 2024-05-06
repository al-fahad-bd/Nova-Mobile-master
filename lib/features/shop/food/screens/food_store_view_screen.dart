import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/components/store_maps.dart';
import 'package:nova_mobile/features/shop/food/components/food_card_style.dart';
import 'package:nova_mobile/features/shop/food/components/food_store_deals_card.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/circle_image_two.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';

class FoodStoreViewScreen extends StatefulWidget {
  final String restaurantImage;
  final String restaurantLocation;
  final String restaurantRatingData;
  final String restaurantName;

  const FoodStoreViewScreen(
      {super.key,
      required this.restaurantImage,
      required this.restaurantLocation,
      required this.restaurantRatingData,
      required this.restaurantName});

  @override
  State<FoodStoreViewScreen> createState() => _FoodStoreViewScreenState();
}

class _FoodStoreViewScreenState extends State<FoodStoreViewScreen> {
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
  String demoMessage =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis massa in nulla condimentum, nec mattis massa tristique. Aenean sit amet rhoncus lorem, id maximus eros. Aenean varius purus a blandit blandit. Phasellus cursus elit nisi, at pulvinar enim viverra eu. Vivamus gravida, mi ac pellentesque vulputate, neque nulla tempor diam, in eleifend diam turpis ac elit. Integer et libero lectus. Proin metus neque, viverra ac congue in, viverra quis lacus. Sed malesuada quis elit fermentum maximus. In a turpis vel libero suscipit consectetur eu et massa. Nullam cursus interdum ultricies. Sed dignissim eros eget sapien mollis euismod sed a ligula. Phasellus tempor nunc sapien, non venenatis nulla aliquam quis. Donec pretium consequat consequat. Morbi ac aliquet quam, non sodales enim. Aliquam pulvinar ut leo eu aliquam. Phasellus ultricies condimentum porttitor. Sed lacinia tortor metus, nec interdum metus tristique suscipit. Ut vitae mi sed quam porta facilisis. Vivamus viverra libero et enim tincidunt, ac pulvinar mauris tincidunt. Nullam et risus eu felis consectetur ullamcorper non nec risus. Fusce aliquam, augue eget eleifend rutrum, nunc diam dictum dolor, vitae fermentum risus nisl ac ex. Sed urna ipsum, tempor et lectus id, finibus vestibulum mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla in risus sodales, tincidunt mauris eget, scelerisque diam.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 240,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                "images/${widget.restaurantImage}",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.8)),
                        icon: const Icon(Icons.arrow_back))),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          shape: BoxShape.circle),
                      child: CircleImageTwo(
                          imageHeight: 68,
                          imageWidth: 68,
                          image: widget.restaurantImage, status: false,),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.restaurantName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: const Icon(
                    IconlyLight.time_circle,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconlyBold.location,
                      size: 14,
                      color: Colors.red,
                    ),
                    Text(
                      widget.restaurantLocation,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),

                //rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyBold.star,
                      size: 14,
                      color: Colors.yellow[700],
                    ),
                    Text(
                      "${widget.restaurantRatingData} (2,247+ rating)",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Row(
                  children: [
                    //delivery time
                    Expanded(
                      child: Container(
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(0.3))),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "30 - 40 min",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Text(
                                    "Delivery time",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    //delivery fee
                    Expanded(
                      child: Container(
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(0.3))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 14,
                                        width: 14,
                                        child: Image.asset(
                                            "images/nigeria-naira-currency-symbol.png"),
                                      ),
                                      const Text(
                                        "0.00",
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "Delivery fee",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Manager",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const Row(
                  children: [
                    CircleImage(
                        imageHeight: 45,
                        imageWidth: 45,
                        image: "banner_img.jpg"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "manager name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "@username",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                ReadMoreText(
                  longText: demoMessage,
                  maxLength: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                //deals
                const FoodStoreDealsCard(),
                const SizedBox(
                  height: 10,
                ),
                //popular items
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Items",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
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
                          foodImage: foodImg[Random().nextInt(foodImg.length)]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //available item
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Items",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
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
                          foodImage: foodImg[Random().nextInt(foodImg.length)]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Find your way to our location",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("Map goes goes here"),
                  ),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
