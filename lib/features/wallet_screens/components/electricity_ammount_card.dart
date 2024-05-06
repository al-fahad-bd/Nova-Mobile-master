import 'package:flutter/material.dart';

class ElectricityAmountCard extends StatelessWidget {
  const ElectricityAmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                    width: 12,
                    child: Center(
                      child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png"),
                    ),
                  ),
                  const SizedBox(width: 3,),
                  const Text(
                    "2,000",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: Center(
                      child: Image.asset(
                        "images/nigeria-naira-currency-symbol.png",
                        color: Colors.blue[800],),
                    ),
                  ),
                  Text(
                    "25",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue[800],
                    ),
                  ),
                  Text(
                    " Nova coin",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue[800],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
