import 'package:flutter/material.dart';

class PostAStoryScreen extends StatefulWidget {
  const PostAStoryScreen({super.key});

  @override
  State<PostAStoryScreen> createState() => _PostAStoryScreenState();
}

class _PostAStoryScreenState extends State<PostAStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("New Story"),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Post", style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}
