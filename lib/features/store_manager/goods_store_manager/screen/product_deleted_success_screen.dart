import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';

class ProductDeletedSuccessScreen extends StatefulWidget {
  const ProductDeletedSuccessScreen({super.key});

  @override
  State<ProductDeletedSuccessScreen> createState() => _ProductDeletedSuccessScreenState();
}

class _ProductDeletedSuccessScreenState extends State<ProductDeletedSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Colors.red[200],
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                        child: Image.asset("images/STK-20240102-WA0072.webp", scale: 6,)
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Deleted!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
              const Text(
                "You have just deleted a product from your current product list",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(title: "Go Back", onTap: () {
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
