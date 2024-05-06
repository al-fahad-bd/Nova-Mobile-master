import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TrackingProgressCard extends StatelessWidget {
  const TrackingProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 45,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              IconlyLight.bag,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 13,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Order progress message",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
