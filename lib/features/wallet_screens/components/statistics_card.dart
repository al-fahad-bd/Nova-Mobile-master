import 'package:flutter/material.dart';

import '../../store_manager/goods_store_manager/component/periodic_selector.dart';

class StatisticsCard extends StatelessWidget {
  final Color currencyColor;
  final String amount;
  final Color barColor;
  final String rate;
  final double mon;
  final double tue;
  final double wed;
  final double thus;
  final double fri;
  final double sat;
  final double sun;
  const StatisticsCard({super.key, required this.currencyColor, required this.amount, required this.barColor, required this.rate, required this.mon, required this.tue, required this.wed, required this.thus, required this.fri, required this.sat, required this.sun});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 0.3,
                offset: const Offset(1, 1)
            ),
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 0.3,
                offset: const Offset(2, 1)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 17,
                      width: 17,
                      child: Image.asset(
                        "images/nigeria-naira-currency-symbol.png",
                        color: currencyColor,
                      ),
                    ),
                    Text(
                      amount,
                      style: TextStyle(color: currencyColor, fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$rate% last week",
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    const PeriodicSelector()
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BarStick(height: mon, day: "Mon", barColors: barColor,),
                    BarStick(height: tue, day: "Tue", barColors: barColor,),
                    BarStick(height: wed, day: "Wed", barColors: barColor,),
                    BarStick(height: thus, day: "Thurs", barColors: barColor,),
                    BarStick(height: fri, day: "Fri", barColors: barColor,),
                    BarStick(height: sat, day: "Sat", barColors: barColor,),
                    BarStick(height: sun, day: "Sun", barColors: barColor,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BarStick extends StatelessWidget {
  final double height;
  final String day;
  final Color barColors;
  const BarStick({super.key, required this.height, required this.day, required this.barColors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: height,
                width: 10,
                decoration: BoxDecoration(
                    color: barColors,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.grey
          ),
        )
      ],
    );
  }
}
