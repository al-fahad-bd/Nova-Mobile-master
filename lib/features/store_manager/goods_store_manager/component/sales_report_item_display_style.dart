import 'package:flutter/material.dart';

class SalesReportItemDisplayStyle extends StatelessWidget {
  const SalesReportItemDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "1",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Image.asset("images/sample_food20.jpg", fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 5,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "fired rice and chicken",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            "ID 10-251-18",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "230",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: 15,),
                  Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png",
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "3k",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(color: Colors.grey[200],),
      ],
    );
  }
}
