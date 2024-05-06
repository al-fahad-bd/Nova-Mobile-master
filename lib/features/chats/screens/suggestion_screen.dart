import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/chats/components/suggestion_display_screen.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestions"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(IconlyLight.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return const SuggestionDisplayStyle();
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
