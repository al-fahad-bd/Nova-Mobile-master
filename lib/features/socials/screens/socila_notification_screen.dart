import 'package:flutter/material.dart';
import 'package:nova_mobile/features/notification/screen/social_notification_display.dart';

class SocialNotificationScreen extends StatefulWidget {
  const SocialNotificationScreen({super.key});

  @override
  State<SocialNotificationScreen> createState() => _SocialNotificationScreenState();
}

class _SocialNotificationScreenState extends State<SocialNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: const SocialNotificationDisplay(),
    );
  }
}
