import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/settings/screens/add_card_screen.dart';
import 'package:nova_mobile/shared_components/atm_card_style.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCardScreen()));
              },
              child: const Text(
                "Add Card",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: ListView(
        children: [
          const ATMCards(),
          const SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }
}
