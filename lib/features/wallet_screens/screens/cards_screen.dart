import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 180,
              width: 180,
              child: Image.asset("images/3d-business-phone-and-credit-cards.png"),
            ),
          ),
          const Text(
            "Coming Soon!",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
          const Text(
            "Cards features are not available now, \nplease check back later",
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
