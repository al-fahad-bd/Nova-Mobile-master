import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/components/expenses_recent_transaction_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/statistics_card.dart';

class ExpensesSection extends StatelessWidget {
  const ExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const StatisticsCard(currencyColor: Colors.red, amount: "280,000,000", barColor: Colors.red, rate: "20", mon: 20, tue: 107, wed: 150, thus: 180, fri: 85, sat: 160, sun: 45,),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Transaction",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
              // Text(
              //   "See All",
              //   style: TextStyle(
              //     color: Colors.grey
              //   ),
              // )
            ],
          ),
          // const SizedBox(height: 5,),
          SizedBox(
            height: 215,
            width: double.infinity,
            child: SizedBox(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const ExpensesRecentTransactionStyle();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
