import 'package:flutter/material.dart';

class FeatureTag extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color tagColor;
  const FeatureTag({super.key, required this.title, required this.titleColor, required this.tagColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: tagColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
        child: Text(
          title,
          style: TextStyle(
              color: titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 12
          ),
        ),
      ),
    );
  }
}
