import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/auth_screens/login_screen/login_screen.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/confirm_details_screen.dart';

class RegistrationSuccessScreen extends StatefulWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  State<RegistrationSuccessScreen> createState() => _RegistrationSuccessScreenState();
}

class _RegistrationSuccessScreenState extends State<RegistrationSuccessScreen> {
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
                    color: Colors.blue[200],
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                        child: Image.asset("images/STK-20240102-WA0070.webp", scale: 6,)
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nice!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
              const Text(
                "Well done, you have successfully created your NOVA account, please head back to the login screen to login and explore",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDefaultButton(title: "Back to login", onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
