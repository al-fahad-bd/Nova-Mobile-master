import 'package:flutter/material.dart';

class FoodCategoryStyle extends StatefulWidget {
  const FoodCategoryStyle({super.key});

  @override
  State<FoodCategoryStyle> createState() => _FoodCategoryStyleState();
}

class _FoodCategoryStyleState extends State<FoodCategoryStyle> {
  List types = [
    "Lunch",
    "BreakFast",
    "Dessert",
    "Pizza",
    "Shawarma",
    "Stakes",
    "Soup",
    "Source",
    "Potatoes",
    "Yam",
    "Burger",
  ];
  List categoryImage = [
    "sample_food3.jpg",
    "sample_food6.jpg",
    "sample_food17.jpg",
    "sample_food16.jpg",
    "sample_food11.jpg",
    "sample_food30.jpg",
    "sample_food28.jpg",
    "sample_food21.jpg",
    "sample_food19.jpg",
    "sample_food13.jpg",
    "sample_food18.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: types.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return DisplayStyle(typeTitle: types[index], typeImg: categoryImage[index],);
        },
      ),
    );
  }
}


class DisplayStyle extends StatefulWidget {
  final String typeTitle;
  final String typeImg;
  const DisplayStyle({ required this.typeTitle, super.key, required this.typeImg});

  @override
  State<DisplayStyle> createState() => _DisplayStyleState();
}

class _DisplayStyleState extends State<DisplayStyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {});
        },
        child: Container(
          height: 80,
          width: 80,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey
          ),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset("images/${widget.typeImg}", fit: BoxFit.cover,),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4)
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    widget.typeTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}