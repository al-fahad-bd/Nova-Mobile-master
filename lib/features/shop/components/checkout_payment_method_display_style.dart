import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/screens/payment_method.dart';

class CheckoutPaymentMethodDisplayStyle extends StatefulWidget {
  const CheckoutPaymentMethodDisplayStyle({super.key});

  @override
  State<CheckoutPaymentMethodDisplayStyle> createState() => _CheckoutPaymentMethodDisplayStyleState();
}

class _CheckoutPaymentMethodDisplayStyleState extends State<CheckoutPaymentMethodDisplayStyle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Payment method",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 85,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("images/master-card-logo.png"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "*** *** ***card number",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: isSelected ? Colors.black : Colors.grey), shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: isSelected ? Colors.black : Colors.transparent,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentMethod()));
                        },
                        child: const Text(
                          "change",
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
