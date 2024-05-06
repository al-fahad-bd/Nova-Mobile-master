import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';

class ProductUploadSuccessScreen extends StatefulWidget {
  const ProductUploadSuccessScreen({super.key});

  @override
  State<ProductUploadSuccessScreen> createState() => _ProductUploadSuccessScreenState();
}

class _ProductUploadSuccessScreenState extends State<ProductUploadSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green[200]),
                child: Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        "images/STK-20240102-WA0070.webp",
                        scale: 5.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Great!",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "You have successfully uploaded a new product and it's 100% up for sales",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Spacer(),
              CustomDefaultButton(
                  title: "Upload More!",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
