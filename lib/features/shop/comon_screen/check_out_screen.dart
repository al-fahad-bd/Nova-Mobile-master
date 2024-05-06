import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/shop/components/checkout_payment_method_display_style.dart';
import 'package:nova_mobile/features/shop/components/shipping_address_display_style.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';
import 'package:nova_mobile/features/shop/screens/product_payment_enterpin_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/enter_pin_screen.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final couponController = TextEditingController();
  bool isPostOfficeSelected = false;
  bool isBalanceSelected = false;
  bool isPayOnDoorStepSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const ShippingAddressDisplayStyle(),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Post office",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isPostOfficeSelected = !isPostOfficeSelected;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: isPostOfficeSelected ? Colors.black : Colors.grey), shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: isPostOfficeSelected ? Colors.black : Colors.transparent,
                                      shape: BoxShape.circle
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const CheckoutPaymentMethodDisplayStyle(),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "Available Balance",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,)
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)
                        ),
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
                                    child: Image.asset("images/nigeria-naira-currency-symbol.png"),
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    "97,560.00",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isBalanceSelected = !isBalanceSelected;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: isBalanceSelected ? Colors.black : Colors.grey), shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: isBalanceSelected ? Colors.black : Colors.transparent,
                                          shape: BoxShape.circle
                                      ),
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
                  const SizedBox(height: 10,),
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
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pay on doorstep",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isPayOnDoorStepSelected = !isPayOnDoorStepSelected;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: isPayOnDoorStepSelected ? Colors.black : Colors.grey), shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: isPayOnDoorStepSelected ? Colors.black : Colors.transparent,
                                      shape: BoxShape.circle
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextSpace(obscureText: false, controller: couponController, hintText: "Coupon Code", prefixIcon: null, suffixIcon: null),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 4,
                        child: ShopButtons(title: "Apply", bgColor: Colors.black, textColor: Colors.white, onTap: (){}),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17
                        ),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
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
                  )
                ],
              ),
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
                            child: Image.asset("images/nigeria-naira-currency-symbol.png", color: Colors.white,),
                          ),
                          const Text(
                            "23,000.00",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                    onSubmit: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPaymentEnterPinScreen()));
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
