import 'package:flutter/material.dart';

class TitledCircleImage extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String image;
  final String imageTitle;
  final VoidCallback onTap;
  const TitledCircleImage({super.key, required this.imageHeight, required this.imageWidth, required this.image, required this.imageTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: imageHeight,
              width: imageWidth,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: Image.asset("images/$image", fit: BoxFit.cover,),
            ),
            Text(
              imageTitle,
              style: TextStyle(
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
