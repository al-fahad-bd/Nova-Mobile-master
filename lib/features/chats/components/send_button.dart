import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SendButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPress;
  const SendButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress,
        style: IconButton.styleFrom(
          backgroundColor: Colors.blue,
          fixedSize: const Size(45, 45)
        ),
        icon: icon
    );
  }
}
