import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/reset_password_screens/reset_password_success_screen.dart';

class ResetNewPasswordScreen extends StatefulWidget {
  const ResetNewPasswordScreen({super.key});

  @override
  State<ResetNewPasswordScreen> createState() => _ResetNewPasswordScreenState();
}

class _ResetNewPasswordScreenState extends State<ResetNewPasswordScreen> {
  final setNewPasswordController = TextEditingController();
  final confirmSetNewPasswordController = TextEditingController();
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextSpace(
              obscureText: isClicked ? false : true,
              controller: setNewPasswordController,
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
              controller: confirmSetNewPasswordController,
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
            CustomDefaultButton(title: "Finish", onTap: () {
              if (setNewPasswordController.text.isNotEmpty && confirmSetNewPasswordController.text.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordSuccessScreen()));
              }
            }),
          ],
        ),
      ),
    );
  }
}
