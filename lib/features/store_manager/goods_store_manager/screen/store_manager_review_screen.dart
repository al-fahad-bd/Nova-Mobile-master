import 'package:flutter/material.dart';
import '../component/store_manager_review_style.dart';

class StoreManagerReviewScreen extends StatefulWidget {
  const StoreManagerReviewScreen({super.key});

  @override
  State<StoreManagerReviewScreen> createState() => _StoreManagerReviewScreenState();
}

class _StoreManagerReviewScreenState extends State<StoreManagerReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const StoreManagerReviewStyle();
          },
        ),
      ),
    );
  }
}
