import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/components/store_maps.dart';

class StoreViewScreen extends StatefulWidget {
  const StoreViewScreen({super.key});

  @override
  State<StoreViewScreen> createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<StoreViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Name"),
        centerTitle: true,
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
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.grey
            ),
            child: Stack(
              children: [
                //map
                const StoreMaps(),
                //layer
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2)
                  ),
                ),
                //details layer
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 5),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Image.asset("images/banner_img2.jpg", fit: BoxFit.cover,),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //category
                                  const Text(
                                    "category name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  //store location
                                  const Text(
                                    "store location will be displayed here",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  //store rating
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 17, color: Colors.yellow[700],),
                                      const Text(
                                        "4.5",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //store owner profile
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "name of user",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),
                                      ),
                                      Text(
                                        "@username",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
