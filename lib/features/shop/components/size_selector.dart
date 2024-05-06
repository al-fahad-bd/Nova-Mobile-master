import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            shape: BoxShape.circle,
            color: isSelected ? Colors.black : Colors.transparent
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                  "1.1",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
