import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/phone_number_space.dart';

class AccountNumberAndAmountScreen extends StatefulWidget {
  const AccountNumberAndAmountScreen({super.key});

  @override
  State<AccountNumberAndAmountScreen> createState() =>
      _AccountNumberAndAmountScreenState();
}

class _AccountNumberAndAmountScreenState
    extends State<AccountNumberAndAmountScreen> {
  final transferToBankAccountNumberController = TextEditingController();
  final transferToBankAmountController = TextEditingController();
  final transferToBankReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer To Bank"),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Send", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      shape: BoxShape.circle),
                  child: Container(
                    height: 60,
                    width: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
                  ),
                ),
                Text(
                  "Bank Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextSpace(
              obscureText: false,
              controller: transferToBankAccountNumberController,
              hintText: "Account number",
              prefixIcon: null,
              suffixIcon: null,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "account name",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("images/nigeria-naira-currency-symbol.png"),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: transferToBankAmountController,
                        decoration: InputDecoration(
                          hintText: "Enter amount",
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextSpace(
              obscureText: false,
              controller: transferToBankReasonController,
              hintText: "Reason (optional)",
              prefixIcon: null,
              suffixIcon: null,
            ),
          ],
        ),
      ),
    );
  }
}
