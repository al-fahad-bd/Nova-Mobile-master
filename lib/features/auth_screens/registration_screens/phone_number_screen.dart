import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/email_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  final String gender;
  final String age;
  const PhoneNumberScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
    required this.gender,
    required this.age,
  });

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Number"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextSpace(
              obscureText: false,
              controller: phoneNumberController,
              hintText: "Enter phone number",
              prefixIcon: const Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              suffixIcon: null,
            ),
            const Spacer(),
            CustomDefaultButton(title: "Next", onTap: () {
              if (phoneNumberController.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailScreen(firstNameValue: widget.firstNameValue, lastNameValue: widget.lastNameValue, otherNameValue: widget.otherNameValue, gender: widget.gender, age: widget.age, phoneNumber: phoneNumberController.text)));
              } else {}
            }),
          ],
        ),
      ),
    );
  }
}
