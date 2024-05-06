import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/features/chats/screens/chat_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/circle_image_two.dart';

class MessagesUserDisplayStyle extends StatefulWidget {
  final String userImage;

  const MessagesUserDisplayStyle({super.key, required this.userImage});

  @override
  State<MessagesUserDisplayStyle> createState() => _MessagesUserDisplayStyleState();
}

class _MessagesUserDisplayStyleState extends State<MessagesUserDisplayStyle> {
  final statusColors = [
    Colors.red,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: Row(
            children: [
              CircleImageTwo(imageHeight: 53, imageWidth: 53, image: widget.userImage, status: true, statusColor: statusColors[Random().nextInt(statusColors.length)],),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "user name",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "user last sent message",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "12:10PM",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
