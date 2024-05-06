import 'dart:ffi';

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String image;
  const CircleImage({super.key, required this.imageHeight, required this.imageWidth, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.
        symmetric(horizontal: 4.0, vertical: 5),
      child: Container(
        height: imageHeight,
        width: imageWidth,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Image.asset("images/$image", fit: BoxFit.cover,),
      ),
    );
  }
}
