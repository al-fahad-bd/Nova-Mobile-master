import 'package:flutter/material.dart';
import 'package:nova_mobile/features/chats/components/messages_user_display_style.dart';
import 'package:nova_mobile/features/shop/food/components/food_notification_style.dart';

class FoodNotificationScreen extends StatefulWidget {
  const FoodNotificationScreen({super.key});

  @override
  State<FoodNotificationScreen> createState() => _FoodNotificationScreenState();
}

class _FoodNotificationScreenState extends State<FoodNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const FoodNotificationStyle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
