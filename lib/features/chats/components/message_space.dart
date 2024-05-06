import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MessageSpace extends StatelessWidget {
  final controller;
  final IconButton? iconButton;
  final Function(String) onChange;
  const MessageSpace({super.key, required this.controller, required this.iconButton, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 220,
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.none
              ),
              borderRadius: BorderRadius.circular(360)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(360),
          ),
          hintText: "send a message",
          prefixIconColor: Colors.grey,
          fillColor: Colors.grey[100],
          filled: true,
          hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300
          ),
          prefixIcon: iconButton,
          contentPadding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
