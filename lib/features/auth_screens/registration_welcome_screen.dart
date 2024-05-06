import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/names_screen.dart';

class RegistrationWelcomeScreen extends StatefulWidget {
  const RegistrationWelcomeScreen({super.key});

  @override
  State<RegistrationWelcomeScreen> createState() =>
      _RegistrationWelcomeScreenState();
}

class _RegistrationWelcomeScreenState extends State<RegistrationWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[200]),
                child: Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        "images/STK-20240102-WA0070.webp",
                        scale: 5.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Hey!",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Seems like you're new here, not to worry i'm NOVA and i'll be assisting you to create your Nova account from start to finish.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                duration: const Duration(milliseconds: 400),
                child: CustomDefaultButton(
                    title: "Let's Go",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NamesScreen()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
