import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/confirm_details_screen.dart';

class PasswordScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  final String gender;
  final String age;
  final String phoneNumber;
  final String email;

  const PasswordScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.email,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextSpace(
              obscureText: isClicked ? false : true,
              controller: passwordController,
              hintText: "Enter password",
              prefixIcon: const Icon(
                IconlyBold.lock,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                icon: Image.asset(
                  isClicked
                      ? "images/feather_eye.png"
                      : "images/feather_eye_off.png",
                  scale: 4,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextSpace(
              obscureText: isClicked ? false : true,
              controller: confirmPasswordController,
              hintText: "Confirm password",
              prefixIcon: const Icon(
                IconlyBold.lock,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                icon: Image.asset(
                  isClicked
                      ? "images/feather_eye.png"
                      : "images/feather_eye_off.png",
                  scale: 4,
                  color: Colors.grey,
                ),
              ),
            ),
            const Spacer(),
            CustomDefaultButton(
                title: "Next",
                onTap: () {
                  if (passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty &&
                      passwordController.text.trim() ==
                          confirmPasswordController.text.trim()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmDetailsScreen(
                                firstNameValue: widget.firstNameValue,
                                lastNameValue: widget.lastNameValue,
                                otherNameValue: widget.otherNameValue,
                                gender: widget.gender,
                                age: widget.age,
                                phoneNumber: widget.phoneNumber,
                                email: widget.email,
                                password: passwordController.text)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password doesn't match")));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
