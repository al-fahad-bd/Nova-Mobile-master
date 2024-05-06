import 'package:flutter/material.dart';
import 'package:nova_mobile/components/text_space.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final oldPasswordController = TextEditingController();
  final setNewPasswordController = TextEditingController();
  final confirmSetNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Save", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Old Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpace(
                      obscureText: false,
                      controller: oldPasswordController,
                      hintText: "Enter old password",
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      suffixIcon: null,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpace(
                      obscureText: false,
                      controller: setNewPasswordController,
                      hintText: "Enter new password",
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      suffixIcon: null,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirm New Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpace(
                      obscureText: false,
                      controller: confirmSetNewPasswordController,
                      hintText: "Confirm new password",
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      suffixIcon: null,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
