import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_default_button.dart';
import '../component/store_manager_bottom_navigation.dart';

class ApplicationMessageScreen extends StatefulWidget {
  const ApplicationMessageScreen({super.key});

  @override
  State<ApplicationMessageScreen> createState() => _ApplicationMessageScreenState();
}

class _ApplicationMessageScreenState extends State<ApplicationMessageScreen> {
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
                "Hello!",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Your application has been received and is been reviewed, check back after 24 hours",
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
                    title: "Back to Home!",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StoreManagerBottomNavigation()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
