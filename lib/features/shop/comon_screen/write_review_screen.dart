import 'package:flutter/material.dart';
import 'package:nova_mobile/components/text_space.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final writeReviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write Review"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Post", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            TextSpace(obscureText: false, controller: writeReviewController, hintText: "Write a review", prefixIcon: null, suffixIcon: null),
            const SizedBox(height: 10,),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                child: Icon(Icons.add),
              ),
            ),
            const Text(
              "You can add multiple images if you wish",
              style: TextStyle(
                  color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
