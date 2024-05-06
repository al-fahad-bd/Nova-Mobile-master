import 'package:flutter/material.dart';

class TransferSuccessScreen extends StatefulWidget {
  const TransferSuccessScreen({super.key});

  @override
  State<TransferSuccessScreen> createState() => _TransferSuccessScreenState();
}

class _TransferSuccessScreenState extends State<TransferSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                        child: Image.asset("images/STK-20240102-WA0471.webp", scale: 6,)
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Transaction Successful!!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
              const Text(
                "You have successfully transfer some funds out of your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "View receipt",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
