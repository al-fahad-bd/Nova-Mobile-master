import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/settings/screens/edit_profile_screen.dart';
import 'package:nova_mobile/features/settings/screens/settings_screen.dart';
import 'package:nova_mobile/features/shop/comon_screen/order_screen.dart';

class ProductPaymentSuccessScreen extends StatefulWidget {
  const ProductPaymentSuccessScreen({super.key});

  @override
  State<ProductPaymentSuccessScreen> createState() => _ProductPaymentSuccessScreenState();
}

class _ProductPaymentSuccessScreenState extends State<ProductPaymentSuccessScreen> {
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
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset("images/STK-20240102-WA0070.webp"),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Thanks for your order!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
              ),
              const Text(
                "Thanks for using our services. Your order has been \nplaced and will begin processing as soon as \npossible",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13
                ),
              ),
              const Spacer(),
              CustomDefaultButton(title: "View Order", onTap: (){
                // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OrderScreen()), (route) => true);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
