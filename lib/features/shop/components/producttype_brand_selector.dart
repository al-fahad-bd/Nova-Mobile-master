import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductTypeBrandSelector extends StatefulWidget {
  const ProductTypeBrandSelector({super.key});

  @override
  State<ProductTypeBrandSelector> createState() => _ProductTypeBrandSelectorState();
}

class _ProductTypeBrandSelectorState extends State<ProductTypeBrandSelector> {
  bool isClicked = false;
  List brands = [
    "GUCCI",
    "Nike",
    "Puma",
    "Adidas",
    "GUCCI",
    "Louis Vuitton",
    "Supra",
    "Prada",
    "Valentino",
    "Balmain",
    "Dior",
    "Versace",
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        height: isClicked ? MediaQuery.of(context).size.height/2 : 50,
        decoration: BoxDecoration(
          color: isClicked ? Colors.transparent : Colors.blue[100],
          borderRadius: BorderRadius.circular(15)
        ),
        child: isClicked ? ListView.builder(
          itemCount: brands.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return SelectorStyle(brandName: brands[index],);
          },
        ) : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Brand"),
                  Icon(IconlyBroken.arrow_down_2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorStyle extends StatefulWidget {
  final String brandName;
  const SelectorStyle({super.key, required this.brandName});

  @override
  State<SelectorStyle> createState() => _SelectorStyleState();
}

class _SelectorStyleState extends State<SelectorStyle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.brandName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.black : Colors.grey
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.transparent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: isSelected ? Colors.white : Colors.transparent, size: 15,),
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

