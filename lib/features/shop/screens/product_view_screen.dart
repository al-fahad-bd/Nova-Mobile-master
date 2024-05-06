import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/components/product_style.dart';
import 'package:nova_mobile/features/shop/components/review_bar.dart';
import 'package:nova_mobile/features/shop/components/review_card_style.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nova_mobile/features/shop/components/size_selector.dart';
import 'package:nova_mobile/features/shop/comon_screen/buy_now_screen.dart';
import 'package:nova_mobile/features/shop/screens/product_review_screen.dart';
import 'package:nova_mobile/features/shop/screens/store_view_screen.dart';
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/services/product_services.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';

class ProductViewScreen extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productCategory;
  const ProductViewScreen({super.key, required this.productImage, required this.productName, required this.productDescription, required this.productPrice, required this.productCategory});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final ProductServices productServices = ProductServices();
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = productServices.getAllProducts(context);
  }
  bool isLoved = false;
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                    "images/nigeria-naira-currency-symbol.png"),
              ),
              Text(
                _formatPrice(double.parse(widget.productPrice)),
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
          actions: [
            //cart
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(IconlyLight.bag)),
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.memory(
                            base64Decode(widget.productImage),
                            fit: BoxFit.contain,
                          ),),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isLoved = !isLoved;
                                          });
                                        },
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.white),
                                        icon: isLoved
                                            ? SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/heart_filled.png",
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/heart_outlined.png",
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {},
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.white),
                                        icon: SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: Image.asset(
                                            "images/add-to-cart.png",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productCategory,
                            style: const TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset("images/feather_copy.png"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "product ID",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: widget.productName,
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
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
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$_rating',
                                  style: const TextStyle(color: Colors.black)),
                              const TextSpan(
                                  text: "  ",
                                  style: TextStyle(color: Colors.black)),
                              const TextSpan(
                                  text: "(87 Reviews)",
                                  style: TextStyle(color: Colors.blue)),
                            ]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: 30,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return const SizeSelector();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              ),
                              const Text(
                                "Available",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreViewScreen()));
                            },
                            child: const SizedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(
                                    "Find Store",
                                    style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //product description
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      ReadMoreText(longText: widget.productDescription, maxLength: 150,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductReviewScreen(reviewData: "$_rating",)));
                            },
                            child: const SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "13 reviews"
                                  ),
                                  Icon(Icons.arrow_right_outlined)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ReviewBar(rates: "$_rating",),

                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return const ReviewCardStyle();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Similar product",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 195,
                        child: FutureBuilder<List<Product>>(
                          future: _futureProducts,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CustomLoader());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
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
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                      child: ShopButtons(
                    title: "Buy Now",
                    bgColor: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BuyFoodNowScreen(foodImage: widget.productImage)));
                    },
                    textColor: Colors.white,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ShopButtons(
                    title: "Add to Cart",
                    bgColor: Colors.blue,
                    onTap: () {},
                    textColor: Colors.white,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  String _formatPrice(double price) {
    try {
      return _formatNumber(price);
    } catch (e) {
      print('Error formatting price: $e');
      return '0';
    }
  }
  String _formatNumber(double number) {
    NumberFormat formatter = NumberFormat("#,###");
    return formatter.format(number);
  }
}

