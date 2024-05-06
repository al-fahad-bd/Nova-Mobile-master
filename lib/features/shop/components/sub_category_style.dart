import 'package:flutter/material.dart';

class SubCategoryStyle extends StatefulWidget {
  final String categoryTitle;
  const SubCategoryStyle({super.key, required this.categoryTitle});

  @override
  State<SubCategoryStyle> createState() => _SubCategoryStyleState();
}

class _SubCategoryStyleState extends State<SubCategoryStyle> {
  bool categoryName = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                categoryName = !categoryName;
              });
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: categoryName ? Colors.black : Colors.transparent,
                  border: Border.all(color: categoryName ? Colors.black : Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                      widget.categoryTitle,
                    style: TextStyle(
                      color: categoryName ? Colors.white : Colors.black
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5,),
        ],
      ),
    );
  }
}
