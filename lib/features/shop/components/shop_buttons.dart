import 'package:flutter/material.dart';

class ShopButtons extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color? textColor;
  final VoidCallback onTap;

  const ShopButtons(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0
        ),
        child: Text(title, style: TextStyle(color: textColor),),
      ),
    );
  }
}
