import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/airtime_bundle_offer_display_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/enter_phone_number_space.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({super.key});

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  final enterAirtimePhoneNumberController = TextEditingController();
  final enterAirtimeAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Airtime"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Image.asset("images/[removal.ai]_9b975584-acf2-4668-8ab6-7fe3886cc205-screenshot_20240217-014908.png"),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Who are you buying for?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                      Text(
                        "How about we subscribe for both our self, \nfamily and friends so we can always \nstay connected, like we never left.",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            EnterPhoneNumberSpace(controller: enterAirtimePhoneNumberController, onClick: (){}),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: GridView.builder(
                itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                  return const AirtimeBundleOfferDisplayStyle();
                  },
              ),
            ),
            const Text("Amount"),
            TextSpace(obscureText: false, controller: enterAirtimeAmountController, hintText: "Enter amount", prefixIcon: null, suffixIcon: null),
            const SizedBox(height: 10,),
            CustomDefaultButton(title: "Pay", onTap: (){})
          ],
        ),
      ),
    );
  }
}
