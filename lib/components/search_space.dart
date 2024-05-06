import 'package:flutter/material.dart';

class SearchSpace extends StatefulWidget {
  final controller;
  final Icon? prefixIcon;
  final String hintText;
  final Function(String)? onChange;
  const SearchSpace({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.onChange,
  });

  @override
  State<SearchSpace> createState() => _SearchSpaceState();
}

class _SearchSpaceState extends State<SearchSpace> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChange,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none
            ),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.hintText,
        fillColor: const Color(0xFFF6F6F7),
        filled: true,
        hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300
        ),
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
