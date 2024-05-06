import 'package:flutter/material.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';

class IncomeRecentTransactionStyle extends StatelessWidget {
  const IncomeRecentTransactionStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return TitledCircleImage(imageHeight: 55, imageWidth: 55, image: "banner_img2.jpg", imageTitle: "Evans", onTap: () {},);
  }
}
