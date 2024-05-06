import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/components/expenses_recent_transaction_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/income_recent_transaction_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/statistics_card.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [const StatisticsCard(currencyColor: Colors.green, amount: "450,000,000", barColor: Colors.blue, rate: "45", mon: 190, tue: 70, wed: 145, thus: 180, fri: 30, sat: 77, sun: 130,),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nova Transaction",
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
            height: 75,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const IncomeRecentTransactionStyle();
              },
            ),
          ),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bank Transaction",
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
            height: 75,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const IncomeRecentTransactionStyle();
              },
            ),
          ),
        ],
      ),
    );
  }
}
