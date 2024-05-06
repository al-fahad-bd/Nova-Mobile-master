import 'package:flutter/material.dart';

class InstantCommentSpace extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function(String) onChange;
  const InstantCommentSpace({super.key, required this.controller, required this.hintText, required this.obscureText, required this.onChange});

  @override
  State<InstantCommentSpace> createState() => _InstantCommentSpaceState();
}

class _InstantCommentSpaceState extends State<InstantCommentSpace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 240,
      padding: const EdgeInsets.all(1),
      child: TextFormField(
        obscureText: widget.obscureText,
        onChanged: widget.onChange,
        controller: widget.controller, style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.transparent
              ),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: widget.hintText,
          fillColor: Colors.white.withOpacity(0.2),
          filled: true,
          hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}
