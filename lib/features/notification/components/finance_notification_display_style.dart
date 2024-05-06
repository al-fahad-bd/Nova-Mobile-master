import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transaction_receipt_view_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/circle_image_two.dart';

class FinanceNotificationDisplayStyle extends StatelessWidget {
  const FinanceNotificationDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionReceiptViewScreen()));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            // color: Colors.grey[200]
          ),
          child: Row(
            children: [
              const CircleImageTwo(imageHeight: 50, imageWidth: 50, image: "banner_img.jpg", status: false,),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "Money Sent ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17
                              )
                          ),
                          TextSpan(
                              text: "(To Bank)",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                fontWeight: FontWeight.bold
                              )
                          ),
                        ]
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "@username",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          )
                        )
                      ]
                    ),
                  )
                ],
              ),
              const Spacer(),
              //amount and date
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //amount
                  Row(
                    children: [
                      SizedBox(
                        height: 17,
                        width: 17,
                        child: Image.asset("images/nigeria-naira-currency-symbol.png"),
                      ),
                      const Text(
                        "12,000.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  // Spacer(),
                  //date and time
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "28-01-2024 12:30AM",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10
                          )
                        )
                      ]
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
