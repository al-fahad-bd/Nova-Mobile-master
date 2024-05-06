import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/components/checkout_payment_method_display_style.dart';
import 'package:nova_mobile/features/shop/components/shipping_address_display_style.dart';
import 'package:nova_mobile/features/shop/screens/product_payment_enterpin_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:slide_to_act/slide_to_act.dart';

class BuyFoodNowScreen extends StatefulWidget {
  final String foodImage;

  const BuyFoodNowScreen(
      {super.key,
      required this.foodImage,});

  @override
  State<BuyFoodNowScreen> createState() => _BuyFoodNowScreenState();
}

class _BuyFoodNowScreenState extends State<BuyFoodNowScreen> {
  bool isBalanceSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(IconlyLight.time_circle),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Delivery time",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  "20 - 30min",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 10,),
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
            const SizedBox(
              height: 10,
            ),
            const ShippingAddressDisplayStyle(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        IconlyLight.profile,
                        size: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Meet at door",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Add delivery note",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_right_outlined)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CheckoutPaymentMethodDisplayStyle(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Available Balance",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                  "images/nigeria-naira-currency-symbol.png"),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "97,560.00",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isBalanceSelected = !isBalanceSelected;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: isBalanceSelected
                                        ? Colors.black
                                        : Colors.grey),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: isBalanceSelected
                                        ? Colors.black
                                        : Colors.transparent,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
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
            const Text(
              "Order",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 75,
                              width: 70,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset("images/${widget.foodImage}", fit: BoxFit.cover,),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "food name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  "Quantity: 5",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey
                                  ),
                                ),
                                Row(
                                  children: [
                                    CircleImage(imageHeight: 30, imageWidth: 30, image: "banner_img.jpg"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "chef name",
                                          style: TextStyle(
                                            fontSize: 13
                                          ),
                                        ),
                                        Text(
                                          "@username",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //subtotal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    "images/nigeria-naira-currency-symbol.png",
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "20,000.00",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        //delivery
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Discount",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    "images/nigeria-naira-currency-symbol.png",
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "00.00",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        //delivery
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Delivery subtotal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(
                                    "images/nigeria-naira-currency-symbol.png",
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "3,000.00",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  const Text(
                    "Slide to pay",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    ),
                  ),
                  SlideAction(
                    borderRadius: 50,
                    elevation: 0,
                    outerColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "images/nigeria-naira-currency-symbol.png",
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "23,000.00",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onSubmit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductPaymentEnterPinScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
