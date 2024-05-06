import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';
import 'package:nova_mobile/features/shop/components/review_card_style.dart';
import 'package:nova_mobile/features/shop/components/store_list_card.dart';
import 'package:nova_mobile/features/shop/components/store_maps.dart';
import 'package:nova_mobile/features/shop/screens/shop_search_screen.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // search
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopSearchScreen()));
              },
              icon: const Icon(IconlyLight.search)),
          // cart
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(IconlyLight.bag)),
        ],
        title: const Text(
          "Available Stores",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //map view
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: const StoreMaps(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Column(
              children: [
                //cloths
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cloth Stores",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const StoreListCard();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                //electronics
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Electronic Stores",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const StoreListCard();
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                //Shoes
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shoe Stores",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const StoreListCard();
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                //electronics
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skin Care Stores",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const StoreListCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
