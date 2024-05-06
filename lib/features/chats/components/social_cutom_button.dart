import 'package:flutter/material.dart';

class SocialCustomButton extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onPress;
  final Color bgColor;
  final Color textColor;
  const SocialCustomButton({super.key, required this.btnTitle, required this.onPress, required this.bgColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 30,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: bgColor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(child: Text(btnTitle, style: TextStyle(color: textColor),)),
        )
        ),
    );
  }
}
