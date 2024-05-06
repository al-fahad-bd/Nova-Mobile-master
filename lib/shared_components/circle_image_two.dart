import 'package:flutter/material.dart';

class CircleImageTwo extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String image;
  final bool? status;
  final Color? statusColor;
  const CircleImageTwo(
      {super.key,
      required this.imageHeight,
      required this.imageWidth,
      required this.image,
        required this.status,
        this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: imageHeight,
          width: imageWidth,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            "images/$image",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white)
            ),
            child: Container(
              height: status == true ? 12 : 0,
              width: status == true ? 12 : 0,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle
              ),
            ),
          ),
        )
      ],
    );
  }
}
