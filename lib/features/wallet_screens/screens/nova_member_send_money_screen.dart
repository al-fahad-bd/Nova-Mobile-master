import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/screens/enter_pin_screen.dart';

class NovaMemberSendMoneyScreen extends StatefulWidget {
  final String username;
  final String userImg;

  const NovaMemberSendMoneyScreen({required this.username, super.key, required this.userImg});

  @override
  State<NovaMemberSendMoneyScreen> createState() =>
      _NovaMemberSendMoneyScreenState();
}

class _NovaMemberSendMoneyScreenState extends State<NovaMemberSendMoneyScreen> {
  String amount = "";
  final reasonForSendingMoney = TextEditingController();

  //button
  Widget otpButtons(int numbers) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 60,
        width: 100,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (amount.length < 4) {
                amount += numbers.toString();
              }
            });
          },
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  numbers.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterPinScreen()));
            },
            child: const Text(
              "Send",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: amount != "" ? Colors.blue : Colors.grey,
                                width: 4),
                          ),
                          child: Container(
                            height: 70,
                            width: 70,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "images/${widget.userImg}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Column(
                          children: [
                            Text(
                              "@${widget.username}",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //amount space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            "images/nigeria-naira-currency-symbol.png",
                            color: amount == "" ? Colors.grey : Colors.black,
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: amount == "" ? "00" : amount,
                              style: TextStyle(
                                color:
                                    amount == "" ? Colors.grey : Colors.black,
                                fontSize: 45,
                              ),
                            ),
                            TextSpan(
                              text: amount == "" ? "" : ".00",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (amount != "")
                      FadeInRight(
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 500),
                        child: TextSpace(
                          obscureText: false,
                          controller: reasonForSendingMoney,
                          hintText: "money for (optional)",
                          prefixIcon: const Icon(
                            IconlyBold.message,
                            color: Colors.grey,
                          ),
                          suffixIcon: null,
                        ),
                      ),
                  ],
                ),
              ),
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  List.generate(3, (index) => otpButtons(1 + 3 * i + index))
                      .toList(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      height: 60,
                      width: 100,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: const Text("")),
                    ),
                  ),
                  otpButtons(0),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      height: 60,
                      width: 100,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              amount =
                                  amount.substring(0, amount.length - 1);
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.backspace,
                                color: Colors.grey,
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
