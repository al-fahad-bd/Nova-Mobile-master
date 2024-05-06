import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/chats/components/request_display_style.dart';
import 'package:nova_mobile/features/chats/components/your_connection_display_style.dart';

class YourFriendsScreen extends StatefulWidget {
  const YourFriendsScreen({super.key});

  @override
  State<YourFriendsScreen> createState() => _YourFriendsScreenState();
}

class _YourFriendsScreenState extends State<YourFriendsScreen> {
  final searchConnectionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Connections"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SearchSpace(controller: searchConnectionController, prefixIcon: const Icon(IconlyLight.search, color: Colors.grey,), hintText: "search..."),
            Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return const YourConnectionDisplayStyle();
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
