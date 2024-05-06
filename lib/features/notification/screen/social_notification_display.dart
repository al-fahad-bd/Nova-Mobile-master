import 'package:flutter/material.dart';
import 'package:nova_mobile/features/notification/components/social_notification_style.dart';

class SocialNotificationDisplay extends StatefulWidget {
  const SocialNotificationDisplay({super.key});

  @override
  State<SocialNotificationDisplay> createState() => _SocialNotificationDisplayState();
}

class _SocialNotificationDisplayState extends State<SocialNotificationDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return const SocialNotificationStyle();
              },
            ),
          )
        ],
      ),
    );
  }
}
