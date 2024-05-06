import 'package:flutter/material.dart';

class CateGoryStyle extends StatefulWidget {
  final String categoryTitle;
  final String categoryImage;
  const CateGoryStyle({super.key, required this.categoryTitle, required this.categoryImage});

  @override
  State<CateGoryStyle> createState() => _CateGoryStyleState();
}

class _CateGoryStyleState extends State<CateGoryStyle> {
  bool categoryName = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: categoryName ? Colors.grey[200] : Colors.transparent,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
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
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: categoryName ? Colors.blue : Colors.grey[200],
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Image.asset("images/${widget.categoryImage}", color: categoryName ? Colors.white : null,),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                          categoryName ? widget.categoryTitle : "".trim()
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}