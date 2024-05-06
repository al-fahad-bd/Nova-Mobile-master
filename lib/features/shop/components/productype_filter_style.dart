import 'package:flutter/material.dart';

class ProductTypeFilterStyle extends StatefulWidget {
  const ProductTypeFilterStyle({super.key});

  @override
  State<ProductTypeFilterStyle> createState() => _ProductTypeFilterStyleState();
}

class _ProductTypeFilterStyleState extends State<ProductTypeFilterStyle> {
  List types = [
    "Men",
    "Shoes",
    "Shirt",
    "Native",
    "Women",
    "Children",
    "Bags",
    "Accessories",
    "Girl",
    "Hat",
    "Boy",
    "Skin Care",
    "Electron",
    "Watch",
    "Sneakers",
    "Car",
    "Jewelry",
    "Appliance",
    "Shorts",
    "Polo",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
            itemCount: types.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4, mainAxisExtent: 110, mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, int index) {
              return DisplayStyle(typeTitle: types[index],);
            },
        ),
      ),
    );
  }
}

class DisplayStyle extends StatefulWidget {
  final String typeTitle;
  const DisplayStyle({ required this.typeTitle, super.key});

  @override
  State<DisplayStyle> createState() => _DisplayStyleState();
}

class _DisplayStyleState extends State<DisplayStyle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.black : Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.black : Colors.transparent
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.typeTitle,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
