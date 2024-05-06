import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/screens/billing_address_screen.dart';

class ShippingAddressDisplayStyle extends StatefulWidget {
  const ShippingAddressDisplayStyle({super.key});

  @override
  State<ShippingAddressDisplayStyle> createState() => _ShippingAddressDisplayStyleState();
}

class _ShippingAddressDisplayStyleState extends State<ShippingAddressDisplayStyle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping address",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "user's name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "177 hilltop, ebonyi abakaliki",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      "block 117",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      "Nigeria",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BillingAddressScreen()));
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
        )
      ],
    );
  }
}
