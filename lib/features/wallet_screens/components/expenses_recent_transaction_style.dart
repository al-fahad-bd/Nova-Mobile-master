import 'package:flutter/material.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';

class ExpensesRecentTransactionStyle extends StatefulWidget {
  const ExpensesRecentTransactionStyle({super.key});

  @override
  State<ExpensesRecentTransactionStyle> createState() => _ExpensesRecentTransactionStyleState();
}

class _ExpensesRecentTransactionStyleState extends State<ExpensesRecentTransactionStyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                shape: BoxShape.circle
              ),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      shape: BoxShape.circle
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Airtime",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "3:20AM 20 Jan 20204",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    color: Colors.grey
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  height: 13,
                  width: 13,
                  child: Image.asset(
                    "images/nigeria-naira-currency-symbol.png",
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "1,000",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
