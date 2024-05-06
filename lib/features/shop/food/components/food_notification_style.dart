import 'package:flutter/material.dart';

class FoodNotificationStyle extends StatelessWidget {
  const FoodNotificationStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Image.asset("images/STK-20240102-WA0070.webp"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Successful",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            "12:30PM-20 November 2023",
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text:
                      "This is to show how the food description will be displayed when been uploaded from whom ever that posted hteihwoasf bias bfasfdoas fubai",
                      style: TextStyle(color: Colors.grey))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
