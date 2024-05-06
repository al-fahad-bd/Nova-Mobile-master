import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/screens/account_number_and_amount_screen.dart';

class BankListStyleOne extends StatelessWidget {
  const BankListStyleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountNumberAndAmountScreen()));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              shape: BoxShape.circle
            ),
            child: Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle
              ),
            ),
          ),
          const Text(
            "bank name",
            style: TextStyle(
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
