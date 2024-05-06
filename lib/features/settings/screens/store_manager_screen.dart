import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';

import '../../store_manager/shared_screen/store_application_screen.dart';

class StoreManagerScreen extends StatefulWidget {
  const StoreManagerScreen({super.key});

  @override
  State<StoreManagerScreen> createState() => _StoreManagerScreenState();
}

class _StoreManagerScreenState extends State<StoreManagerScreen> {
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
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[200]),
                child: Center(
                  child: Container(
                    height: 80,
                    width: 80,
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
                "Hey Again!",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Seems like you're not a store manager, well clicking the button gives you an option to push your business to the next level by helping ypu sell and manager all your assets online",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 800),
                child: CustomDefaultButton(
                    title: "Let's Go",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StoreNameScreen()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
