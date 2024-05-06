import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/screens/account_number_and_amount_screen.dart';

class BankListStyleTwo extends StatelessWidget {

  const BankListStyleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountNumberAndAmountScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(width: 10,),
            const Text(
              "bank name",
              style: TextStyle(
                  fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
