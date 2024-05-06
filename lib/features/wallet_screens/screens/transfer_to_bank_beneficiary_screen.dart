import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/wallet_screens/components/beneficiary_display_style.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transfer_to_bank.dart';

class TransferToBankBeneficiaryScreen extends StatefulWidget {
  const TransferToBankBeneficiaryScreen({super.key});

  @override
  State<TransferToBankBeneficiaryScreen> createState() => _TransferToBankBeneficiaryScreenState();
}

class _TransferToBankBeneficiaryScreenState extends State<TransferToBankBeneficiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer To Bank"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Beneficiaries",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.blue,),
                    Text("Add")
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return BeneficiaryDisplayStyle();
                },
              ),
            ),
            CustomDefaultButton(title: "Select Bank", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferToBankScreen()));
            })
          ],
        ),
      ),
    );
  }
}
