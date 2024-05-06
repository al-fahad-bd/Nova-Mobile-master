import 'package:flutter/material.dart';

class StoreManagerNotificationScreen extends StatefulWidget {
  const StoreManagerNotificationScreen({super.key});

  @override
  State<StoreManagerNotificationScreen> createState() => _StoreManagerNotificationScreenState();
}

class _StoreManagerNotificationScreenState extends State<StoreManagerNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
    );
  }
}
