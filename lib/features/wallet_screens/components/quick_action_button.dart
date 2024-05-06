import 'package:flutter/material.dart';

class QuickActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final Image icon;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onClick,
          style: IconButton.styleFrom(
              fixedSize: const Size(53, 53), backgroundColor: Colors.grey[200]),
          icon: SizedBox(
            height: 23,
            width: 23,
            child: Center(
              child: icon,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
