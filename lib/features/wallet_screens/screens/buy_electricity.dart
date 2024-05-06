import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/electricity_ammount_card.dart';

class BuyElectricity extends StatefulWidget {
  const BuyElectricity({super.key});

  @override
  State<BuyElectricity> createState() => _BuyElectricityState();
}

class _BuyElectricityState extends State<BuyElectricity> {
  final meterNumberController = TextEditingController();
  final enterElectricityAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Electricity"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Provider name")
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_downward))
              ],
            ),
            const Text(
              "Easily pay for your electricity bills in just few clicks and turn the TV back on.",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Item",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Prepaid",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Meter Number",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12
                          ),
                        ),
                        TextSpace(
                          obscureText: false,
                          controller: meterNumberController,
                          hintText: "Enter meter number",
                          prefixIcon: null,
                          suffixIcon: null,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Select Amount",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 80),
                    itemBuilder: (BuildContext context, int index) {
                      return const ElectricityAmountCard();
                    },
                  ),
                ),
              ],
            ),

            const Text("Amount"),
            TextSpace(obscureText: false, controller: enterElectricityAmountController, hintText: "Enter amount", prefixIcon: null, suffixIcon: null),
            const SizedBox(height: 10,),
            CustomDefaultButton(title: "Pay", onTap: (){})
          ],
        ),
      ),
    );
  }
}
