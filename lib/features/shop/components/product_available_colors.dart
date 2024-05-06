import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductAvailableColor extends StatefulWidget {
  const ProductAvailableColor({super.key});

  @override
  State<ProductAvailableColor> createState() => _ProductAvailableColorState();
}

class _ProductAvailableColorState extends State<ProductAvailableColor> {
  List colorsList = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.pinkAccent,
    Colors.brown,
    Colors.blueGrey,
    Colors.black,
    Colors.white,
    Colors.white38,
    Colors.white12,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.purpleAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.lime,
    Colors.lightBlueAccent,
    Colors.limeAccent,
    Colors.lightGreenAccent,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.black54,
  ];
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        height: isClicked ? 220 : 50,
        decoration: BoxDecoration(
          color: isClicked ? Colors.transparent : Colors.blue[100],
          borderRadius: BorderRadius.circular(15)
        ),
        child: isClicked ? SizedBox(
          height: 220,
          width: double.infinity,
          child: GridView.builder(
              itemCount: colorsList.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return ColorsStyle(Acolors: colorsList[index],);
              }
          ),
        ) : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Colors"),
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

class ColorsStyle extends StatefulWidget {
  final Color Acolors;
  const ColorsStyle({super.key, required this.Acolors});

  @override
  State<ColorsStyle> createState() => _ColorsStyleState();
}

class _ColorsStyleState extends State<ColorsStyle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: isSelected ? widget.Acolors : Colors.grey, width: 2),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: widget.Acolors,
                    shape: BoxShape.circle
                  ),
                ),
              ),
            ),
          ),
          Text(
            isSelected ? "Selected" : "",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
