import 'package:flutter/material.dart';

class HomeScreenStorySCircleDisplayStyle extends StatelessWidget {
  const HomeScreenStorySCircleDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
          ),
          const Text(
            "username",
            style: TextStyle(
              fontSize: 11
            ),
          )
        ],
      ),
    );
  }
}
