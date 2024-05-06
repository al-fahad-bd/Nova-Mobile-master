import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/password_screen.dart';

class EmailScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  final String gender;
  final String age;
  final String phoneNumber;
  const EmailScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
    required this.gender,
    required this.age,
    required this.phoneNumber,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextSpace(
              obscureText: false,
              controller: emailController,
              hintText: "Enter email",
              prefixIcon: const Icon(
                IconlyBold.message,
                color: Colors.grey,
              ),
              suffixIcon: null,
            ),
            const SizedBox(
              height: 15,
            ),
            TextSpace(
              obscureText: false,
              controller: confirmEmailController,
              hintText: "Confirm email",
              prefixIcon: const Icon(
                IconlyBold.message,
                color: Colors.grey,
              ),
              suffixIcon: null,
            ),
            const Spacer(),
            CustomDefaultButton(title: "Next", onTap: () {
              if (emailController.text.isNotEmpty &&
                  confirmEmailController.text.isNotEmpty && emailController.text.trim() == confirmEmailController.text.trim()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordScreen(firstNameValue: widget.firstNameValue, lastNameValue: widget.lastNameValue, otherNameValue: widget.otherNameValue, gender: widget.gender, age: widget.age, phoneNumber: widget.phoneNumber, email: emailController.text)));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email doesn't match")));
              }
            }),
          ],
        ),
      ),
    );
  }
}
