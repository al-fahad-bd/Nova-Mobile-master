import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/components/review_bar.dart';
import 'package:nova_mobile/features/shop/comon_screen/buy_now_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';

class FoodViewScreen extends StatefulWidget {
  final String foodImage;

  const FoodViewScreen({super.key, required this.foodImage});

  @override
  State<FoodViewScreen> createState() => _FoodViewScreenState();
}

class _FoodViewScreenState extends State<FoodViewScreen> {
  int foodQuantity = 1;
  bool isClicked = false;
  String demoMessage =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis massa in nulla condimentum, nec mattis massa tristique. Aenean sit amet rhoncus lorem, id maximus eros. Aenean varius purus a blandit blandit. Phasellus cursus elit nisi, at pulvinar enim viverra eu. Vivamus gravida, mi ac pellentesque vulputate, neque nulla tempor diam, in eleifend diam turpis ac elit. Integer et libero lectus. Proin metus neque, viverra ac congue in, viverra quis lacus. Sed malesuada quis elit fermentum maximus. In a turpis vel libero suscipit consectetur eu et massa. Nullam cursus interdum ultricies. Sed dignissim eros eget sapien mollis euismod sed a ligula. Phasellus tempor nunc sapien, non venenatis nulla aliquam quis. Donec pretium consequat consequat. Morbi ac aliquet quam, non sodales enim. Aliquam pulvinar ut leo eu aliquam. Phasellus ultricies condimentum porttitor. Sed lacinia tortor metus, nec interdum metus tristique suscipit. Ut vitae mi sed quam porta facilisis. Vivamus viverra libero et enim tincidunt, ac pulvinar mauris tincidunt. Nullam et risus eu felis consectetur ullamcorper non nec risus. Fusce aliquam, augue eget eleifend rutrum, nunc diam dictum dolor, vitae fermentum risus nisl ac ex. Sed urna ipsum, tempor et lectus id, finibus vestibulum mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla in risus sodales, tincidunt mauris eget, scelerisque diam.";
  List imageList = [
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
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [],
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          "images/${widget.foodImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.2)),
                      ),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8)),
                              icon: Icon(Icons.arrow_back),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8)),
                              icon: Icon(IconlyLight.heart, color: isClicked ? Colors.red : Colors.black,),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "food name goes here.",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 38,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (foodQuantity == 1) {
                                            foodQuantity = 1;
                                          } else {
                                            setState(() {
                                              foodQuantity -= 1;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey[300]),
                                          child: const Center(
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            "$foodQuantity",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            foodQuantity += 1;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey[300]),
                                          child: const Center(
                                            child: Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                      "images/nigeria-naira-currency-symbol.png"),
                                ),
                                const Text(
                                  "1,222",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "food name will appear here",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  IconlyLight.heart,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "340k",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  IconlyLight.time_circle,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "25min",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "34,000 delivery today",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("$_rating rating"),
                                Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow[700],
                                      )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text("Give your rating"),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      child: RatingBar.builder(
                                        initialRating: _rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                        itemBuilder: (context, _) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            _rating = rating;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Chef",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            CircleImage(
                                imageHeight: 50,
                                imageWidth: 50,
                                image: "banner_img2.jpg"),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sharon Daniels",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "@username",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReadMoreText(
                          longText: demoMessage,
                          maxLength: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ingredient",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: recipeImage.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return CircleImage(
                                  imageHeight: 55,
                                  imageWidth: 55,
                                  image: recipeImage[
                                      Random().nextInt(recipeImage.length)]);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Review",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Add Review",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        ReviewBar(
                          rates: "0.0",
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: imageList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return CircleImage(
                                  imageHeight: 55,
                                  imageWidth: 55,
                                  image: imageList[
                                      Random().nextInt(imageList.length)]);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 17,
                                  width: 17,
                                  child: Image.asset(
                                      "images/nigeria-naira-currency-symbol.png"),
                                ),
                                const Text(
                                  "1,222",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(360)),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  )),
            ),
            Container(
              height: 40,
              width: 1,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            Expanded(
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyFoodNowScreen(foodImage: widget.foodImage)));
                  },
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
