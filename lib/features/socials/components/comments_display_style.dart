import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CommentsDisplayStyle extends StatelessWidget {
  const CommentsDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
                ),
                const Row(
                  children: [
                    Icon(IconlyLight.heart, size: 15,),
                    Text("10"),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "username",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "2days ago",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Simulating how the actual comments will be \ndisplayed by each user and how the \nreactions on it will be displayed",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13
                        )
                      )
                    ]
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
