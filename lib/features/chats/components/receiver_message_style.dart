import 'package:flutter/material.dart';

class ReceiverMessageStyle extends StatelessWidget {
  final String receiverMessage;
  const ReceiverMessageStyle({required this.receiverMessage,super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                  color: Colors.grey[400]
              ),
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: receiverMessage.trim(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                        ),
                      ]
                  )
              ),
            ),
            const Text(
              "12:30AM",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ),
    );
  }
}
