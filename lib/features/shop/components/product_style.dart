import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/features/shop/screens/product_view_screen.dart';
import 'package:nova_mobile/shared_components/long_name_handler.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';

class ProductStyle extends StatefulWidget {
  final String name;
  final String description;
  final String productPrice;
  final String productImage;
  final String productCategory;
  const ProductStyle({super.key, required this.productImage, required this.name, required this.description, required this.productPrice, required this.productCategory});

  @override
  State<ProductStyle> createState() => _ProductStyleState();
}

class _ProductStyleState extends State<ProductStyle> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewScreen(productImage: widget.productImage, productName: widget.name, productDescription: widget.description, productPrice: widget.productPrice, productCategory: widget.productCategory,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Container(
          height: 180,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.memory(
                        base64Decode(widget.productImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //overlay background
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              icon: SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset("images/add-to-cart.png", color: Colors.white,),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLoved = !isLoved;
                                });
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              icon: isLoved
                                  ? SizedBox(
                                      height: 25,
                                      width: 25,
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //title
                    LongNameHandler(longText: widget.name, maxLength: 11, size: 15, weight: FontWeight.w500,),
                    LongNameHandler(longText: widget.name, maxLength: 13, size: 11, color: Colors.grey,),
                    Text(widget.productCategory, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset(
                              "images/nigeria-naira-currency-symbol.png"),
                        ),
                        Text(
                          _formatPrice(double.parse(widget.productPrice)),
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
