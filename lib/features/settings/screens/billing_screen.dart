import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/components/other_settings_display_style.dart';
import 'package:nova_mobile/features/settings/screens/billing_address_screen.dart';
import 'package:nova_mobile/features/settings/screens/payment_method.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Billing Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            OtherSettingsDisplayStyle(title: "Billing Address", icon: Image.asset("images/worldwide.png"), onClick: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BillingAddressScreen()));
            },),
            OtherSettingsDisplayStyle(title: "Payment Method", icon: Image.asset("images/give-money.png"), onClick: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethod()));
            },),
          ],
        ),
      ),
    );
  }
}
