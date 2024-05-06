import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/reset_password_screens/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const Text(
                "Don't worry, we've got you covered please enter the email address linked to your Nova account so you can receive an OTP for you to be able to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),
              TextSpace(
                obscureText: false,
                controller: forgotPasswordEmailController,
                hintText: "Enter email",
                prefixIcon: const Icon(
                  IconlyBold.message,
                  color: Colors.grey,
                ),
                suffixIcon: null,
              ),
              const Spacer(),
              CustomDefaultButton(title: "Get OTP", onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
