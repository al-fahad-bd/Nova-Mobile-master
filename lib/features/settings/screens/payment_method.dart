import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/components/other_settings_display_style.dart';
import 'package:nova_mobile/features/settings/screens/cards_screen.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Cards",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,)
                ),
                OtherSettingsDisplayStyle(title: "Cards", icon: Image.asset("images/wallet.png"), onClick: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CardsScreen()));
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
}
