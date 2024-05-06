import 'package:flutter/material.dart';

class GamesAmountCard extends StatelessWidget {
  const GamesAmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
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
                  const Text(
                    "Pay ",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Center(
                          child: Image.asset(
                              "images/nigeria-naira-currency-symbol.png", color: Colors.grey,),
                        ),
                      ),
                      const SizedBox(width: 3,),
                      const Text(
                        "2,000",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
