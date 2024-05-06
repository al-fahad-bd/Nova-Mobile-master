import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/chats/components/suggestion_display_screen.dart';

class AddConnectionScreen extends StatefulWidget {
  const AddConnectionScreen({super.key});

  @override
  State<AddConnectionScreen> createState() => _AddConnectionScreenState();
}

class _AddConnectionScreenState extends State<AddConnectionScreen> {
  final addConnectionSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peaple"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SearchSpace(controller: addConnectionSearchController, prefixIcon: const Icon(IconlyLight.search), hintText: "search..."),
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
