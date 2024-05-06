import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/gender_screen.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({super.key});

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final otherNamesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Names"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextSpace(
                obscureText: false,
                controller: firstNameController,
                hintText: "Enter first name",
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                suffixIcon: null),
            const SizedBox(
              height: 15,
            ),
            TextSpace(
                obscureText: false,
                controller: lastNameController,
                hintText: "Enter last name",
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                suffixIcon: null),
            const SizedBox(
              height: 15,
            ),
            TextSpace(
                obscureText: false,
                controller: otherNamesController,
                hintText: "Other names (optional)",
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                suffixIcon: null),
            const Spacer(),
            CustomDefaultButton(title: "Next", onTap: () {
              if (firstNameController.text.isNotEmpty &&
                  lastNameController.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GenderScreen(firstNameValue: firstNameController.text, lastNameValue: lastNameController.text, otherNameValue: otherNamesController.text)));
              } else {}
            }),
          ],
        ),
      ),
    );
  }
}
