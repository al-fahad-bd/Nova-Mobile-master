import 'package:flutter/material.dart';
import 'package:nova_mobile/features/notification/screen/finance_notification_display.dart';

class FinanceNotificationScreen extends StatefulWidget {
  const FinanceNotificationScreen({super.key});

  @override
  State<FinanceNotificationScreen> createState() => _FinanceNotificationScreenState();
}

class _FinanceNotificationScreenState extends State<FinanceNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notification"),
      ),
      body: const FinanceNotificationDisplay(),
    );
  }
}
