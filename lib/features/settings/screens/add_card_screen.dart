import 'package:flutter/material.dart';

import '../../../components/custom_default_button.dart';
import '../../../components/text_space.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cardExpMonthController = TextEditingController();
  final cardExpYearController = TextEditingController();
  final cardCVVController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextSpace(
                    obscureText: false,
                    controller: cardNameController,
                    hintText: "Card Name",
                    prefixIcon: null,
                    suffixIcon: null),
                const SizedBox(
                  height: 10,
                ),
                TextSpace(
                    obscureText: false,
                    controller: cardNumberController,
                    hintText: "Card Number",
                    prefixIcon: null,
                    suffixIcon: null),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextSpace(
                          obscureText: false,
                          controller: cardExpMonthController,
                          hintText: "Expire Month",
                          prefixIcon: null,
                          suffixIcon: null),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextSpace(
                          obscureText: false,
                          controller: cardExpYearController,
                          hintText: "Expire Year",
                          prefixIcon: null,
                          suffixIcon: null),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextSpace(
                    obscureText: false,
                    controller: cardCVVController,
                    hintText: "CVV",
                    prefixIcon: null,
                    suffixIcon: null),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: isChecked ? Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Icon(Icons.check, color: Colors.white, size: 15,),
                        ),
                      ) : Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      "Use as default card",
                      style: TextStyle(
                        color: isChecked ? Colors.black : Colors.grey
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDefaultButton(title: "Add Card", onTap: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
