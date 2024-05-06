import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 180,
              width: 180,
              child: Image.asset("images/casual-life-3d-cardboard-boxes.png"),
            ),
          ),
          const Text(
            "Empty Wish List!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          const Text(
            "You currently have not added any \nproduct to your wish list",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
