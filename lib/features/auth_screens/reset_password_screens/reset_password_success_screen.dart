import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/auth_screens/login_screen/login_screen.dart';

class ResetPasswordSuccessScreen extends StatefulWidget {
  const ResetPasswordSuccessScreen({super.key});

  @override
  State<ResetPasswordSuccessScreen> createState() =>
      _ResetPasswordSuccessScreenState();
}

class _ResetPasswordSuccessScreenState
    extends State<ResetPasswordSuccessScreen> {
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
                    color: Colors.green[200], shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Center(
                        child: Image.asset(
                      "images/STK-20240102-WA0298.webp",
                      scale: 6,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nice!",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const Text(
                "Well done, your password has been changed from the old one that you forgot to the new one which you have just set",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(
                title: "Back to login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
