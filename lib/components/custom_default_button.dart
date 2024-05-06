import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomDefaultButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
              // fontSize: 15,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
