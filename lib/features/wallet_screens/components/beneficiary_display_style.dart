import 'package:flutter/material.dart';

class BeneficiaryDisplayStyle extends StatelessWidget {
  const BeneficiaryDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                shape: BoxShape.circle
              ),
              child: Container(
                height: 60,
                width: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle
                ),
              ),
            ),
            const SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Bank Name",
                        style: TextStyle(
                            color: Colors.black,
                          fontSize: 18
                        )
                      ),
                      TextSpan(
                          text: " (Account Number)",
                          style: TextStyle(color: Colors.black)
                      ),
                    ]
                  ),
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "account name",
                            style: TextStyle(color: Colors.black)
                        ),
                      ]
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
