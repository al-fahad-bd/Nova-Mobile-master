import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/screens/tracking_screen.dart';

class OrderDisplayCardStyle extends StatelessWidget {
  final bool isDelivered;
  const OrderDisplayCardStyle({super.key, required this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 138,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset("images/sample_food23.jpg", fit: BoxFit.cover,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //product name
                      const Text(
                        "product name",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      //price
                      Row(
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              "images/nigeria-naira-currency-symbol.png",
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "23,000.00",
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      //number of items
                      const Text(
                        "4 Items",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                  isDelivered ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.delivery_dining, color: Colors.blue,),
                          Text(
                            " In Progress",
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Row(
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: Colors.blue
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle
                            ),
                          ),
                        ],
                      ),
                    ],
                  ) : const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.green,),
                          Text(
                            " Delivered",
                            style: TextStyle(
                                color: Colors.green
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Jul 24, at 3:30PM",
                        style: TextStyle(
                          color: Colors.grey

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: const Center(
                        child: Text(
                          "Return",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackingScreen()));
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Center(
                          child: Text(
                            "Tracking",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
