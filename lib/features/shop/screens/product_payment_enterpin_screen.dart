import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/screens/product_payment_success_screen.dart';

class ProductPaymentEnterPinScreen extends StatefulWidget {
  const ProductPaymentEnterPinScreen({super.key});

  @override
  State<ProductPaymentEnterPinScreen> createState() => _ProductPaymentEnterPinScreenState();
}

class _ProductPaymentEnterPinScreenState extends State<ProductPaymentEnterPinScreen> {
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
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            if (transferPIN != "" && transferPIN == actualPIN) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ProductPaymentSuccessScreen()));
            } else {}
          }, child: const Text("Pay", style: TextStyle(color: Colors.blue),))
        ],
      ),
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
            Container(
              height: 30,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
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
