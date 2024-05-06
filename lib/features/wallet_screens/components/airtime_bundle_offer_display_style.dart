import 'package:flutter/material.dart';

class AirtimeBundleOfferDisplayStyle extends StatelessWidget {
  const AirtimeBundleOfferDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                    "200",
                    style: TextStyle(
                        fontSize: 20,
                      fontWeight: FontWeight.w500
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
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                      child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png", color: Colors.grey,),
                    ),
                  ),
                  const SizedBox(width: 3,),
                  const Text(
                    "200",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      color: Colors.grey
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
