import 'package:flutter/material.dart';

class PhoneNumberSpace extends StatelessWidget {
  final controller;
  final IconButton? suffixIcon;
  const PhoneNumberSpace({super.key, required this.controller, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Phone number",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
