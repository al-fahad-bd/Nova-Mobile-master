import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/shop/comon_screen/check_out_screen.dart';
import 'package:nova_mobile/features/shop/components/cart_item_style.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';
import 'package:provider/provider.dart';

import '../../../services/user_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List productImageList = [
    "product1.jpg",
    "product43.jpg",
    "product44.jpg",
    "product45.jpg",
    "product46.jpg",
    "product47.jpg",
    "product42.jpg",
    "product48.jpg",
    "product49.jpg",
    "product50.jpg",
    "product51.jpg",
    "product52.jpg",
    "product53.jpg",
    "product54.jpg",
    "product55.jpg",
    "product56.jpg",
    "product57.jpg",
    "product58.jpg",
    "product59.jpg",
    "product60.jpg",
    "product61.jpg",
    "product62.jpg",
    "product63.jpg",
    "product64.jpg",
    "product65.jpg",
    "product66.jpg",
    "product67.jpg",
    "product68.jpg",
    "product69.jpg",
    "product70.jpg",
    "product71.jpg",
    "product72.jpg",
    "product73.jpg",
    "product74.jpg",
    "product75.jpg",
    "product76.jpg",
    "product78.jpg",
    "product0078.jpg",
    "product79.jpg",
    "product80.jpg",
    "product81.jpg",
    "product82.jpg",
    "product83.jpg",
    "product84.jpg",
    "product85.jpg",
    "product86.jpg",
    "product87.jpg",
    "product88.jpg",
    "product89.jpg",
    "product90.jpg",
    "product337.jpg",
    "product345.jpg",
    "product383.jpg",
    "product384.jpg",
    "product432.jpg",
    "product446.jpg",
    "product456.jpg",
    "product543.jpg",
    "product554.jpg",
    "product567.jpg",
    "product639.jpg",
    "product648.jpg",
    "product654.jpg",
    "product663.jpg",
    "product667.jpg",
    "product678.jpg",
    "product748.jpg",
    "product765.jpg",
    "product778.jpg",
    "product789.jpg",
    "product828.jpg",
    "product848.jpg",
    "product857.jpg",
    "product876.jpg",
    "product890.jpg",
    "product987.jpg",
    "product998.jpg",
    "product1111.jpg",
    "product1223.jpg",
    "product2222.jpg",
    "product2238.jpg",
    "product2344.jpg",
    "product3339.jpg",
    "product3450.jpg",
    "product4435.jpg",
    "product4553.jpg",
    "product5272.jpg",
    "product5383.jpg",
    "product6383.jpg",
    "product6384.jpg",
    "product6393.jpg",
    "product6673.jpg",
    "product7383.jpg",
    "product7384.jpg",
    "product7394.jpg",
    "product7722.jpg",
    "product7733.jpg",
    "product9867.jpg",
    "product22237.jpg",
    "product36832.jpg",
    "product44634.jpg",
    "product63932.jpg",
    "product73830.jpg",
    "product333336.jpg",
    "product555533.jpg",
    "product899931.jpg",
    "product7383632.jpg",
    "product91.jpg",
    "product92.jpg",
    "product93.jpg",
    "product94.jpg",
    "product95.jpg",
    "product96.jpg",
    "product97.jpg",
    "product98.jpg",
    "product098.jpg",
    "product99.jpg",
    "product100.jpg",
    "product101.jpg",
    "product102.jpg",
    "product103.jpg",
    "product104.jpg",
    "product105.jpg",
    "product106.jpg",
    "product107.jpg",
    "product108.jpg",
    "product109.jpg",
    "product123.jpg",
    "product222.jpg",
    "product234.jpg",
    "product263.jpg",
    "product321.jpg",
    "product335.jpg",
    "product14.jpg",
    "product15.jpg",
    "product16.jpg",
    "product016.jpg",
    "product17.jpg",
    "product18.jpg",
    "product19.jpg",
    "product20.jpg",
    "product21.jpg",
    "product22.jpg",
    "product23.jpg",
    "product24.jpg",
    "product25.jpg",
    "product26.jpg",
    "product27.jpg",
    "product28.jpg",
    "product29.jpg",
    "product30.jpg",
    "product31.jpg",
    "product32.jpg",
    "product33.jpg",
    "product34.jpg",
    "product35.jpg",
    "product40.jpg",
    "product41.jpg",
    "product3.jpg",
    "product0003.jpg",
    "product4.jpg",
    "product5.jpg",
    "product0005.jpg",
    "product2.jpg",
    "product6.jpg",
    "product7.jpg",
    "product0007.jpg",
    "product8.jpg",
    "product9.jpg",
    "product10.jpg",
    "product11.jpg",
    "product12.jpg",
    "product13.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().userModel;
    // int sum = 0;
    // user.cart
    //     .map((e) => sum += e['quantity'] * e['product']['price'] as int)
    //     .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              // itemCount: user.cart.length,
              itemBuilder: (context, index) {
                return CartItemStyle(productImage: productImageList[Random().nextInt(productImageList.length)]);
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: Image.asset(
                                      "images/nigeria-naira-currency-symbol.png",
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "12,000.00",
                                    style: const TextStyle(color: Colors.black, fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ShopButtons(
                              title: "Checkout",
                              bgColor: Colors.blue,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen()));
                              }, textColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
