import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';

class TVRechargeScreen extends StatefulWidget {
  const TVRechargeScreen({super.key});

  @override
  State<TVRechargeScreen> createState() => _TVRechargeScreenState();
}

class _TVRechargeScreenState extends State<TVRechargeScreen> {
  final smartCardNumberController = TextEditingController();
  String paymentPeriod = "";
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TV"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Provider",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text(
                                "SportyBet"
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_right, color: Colors.grey,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Smart-card Number",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Text(
                          "Beneficiaries >",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextSpace(obscureText: false, controller: smartCardNumberController, hintText: "0000 0000 0000", prefixIcon: null, suffixIcon: null),
                    const SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Period",
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  paymentPeriod = "7 days";
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: paymentPeriod == "7 days" ? Colors.blue.withOpacity(0.02) : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: paymentPeriod == "7 days" ? 1.5 : 0, color: paymentPeriod == "7 days" ? Colors.blue : Colors.transparent)
                                ),
                                child: Center(
                                  child: Text(
                                    "7 Days",
                                    style: TextStyle(
                                      color: paymentPeriod == "7 days" ? Colors.blue : Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  paymentPeriod = "30 days";
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: paymentPeriod == "30 days" ? Colors.blue.withOpacity(0.02) : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: paymentPeriod == "30 days" ? 1.5 : 0, color: paymentPeriod == "30 days" ? Colors.blue : Colors.transparent)
                                ),
                                child: Center(
                                  child: Text(
                                    "30 Days",
                                    style: TextStyle(
                                        color: paymentPeriod == "30 days" ? Colors.blue : Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    //packages
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Package",
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Please select your package"
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Save Beneficiary",
                              style: TextStyle(
                                color: isChecked ? Colors.blue : Colors.grey
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: isChecked ? Colors.blue : Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                  color: isChecked ? Colors.blue : Colors.transparent
                                ),
                                child: Center(
                                  child: Icon(Icons.check, size: 15, color: isChecked ? Colors.white : Colors.transparent,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    CustomDefaultButton(title: "Pay", onTap: (){})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
