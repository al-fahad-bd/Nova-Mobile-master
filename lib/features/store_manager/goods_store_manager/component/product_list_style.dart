import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../screen/add_product_screen.dart';

class ProductListStyle extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const ProductListStyle(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productQuantity,
      required this.onEditPressed,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.memory(
                base64Decode(productImage),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 14,
                          width: 14,
                          child: Image.asset(
                            "images/nigeria-naira-currency-symbol.png",
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          _formatPrice(double.parse(productPrice)),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$productQuantity in stocks",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: onEditPressed,
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue),
                )),
            IconButton(
                onPressed: onDeletePressed,
                icon: const Icon(
                  IconlyLight.delete,
                  color: Colors.red,
                ))
          ],
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
