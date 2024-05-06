import 'package:flutter/material.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transfer_successfull_screen.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  String transferPIN = "";
  String actualPIN = "2024";

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
              if (transferPIN.length < 4) {
                transferPIN += numbers.toString();
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Transfer PIN",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            const Text(
              "Please enter your PIN to complete this transaction",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: index < transferPIN.length
                          ? Colors.blue[800]
                          : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            for (int i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            transferPIN =
                                transferPIN.substring(0, transferPIN.length - 1);
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
    );
  }
}
