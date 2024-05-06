import 'package:flutter/material.dart';

class SocialNotificationStyle extends StatelessWidget {
  const SocialNotificationStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle
              ),
              child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
            ),
            const SizedBox(width: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "user name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "the quick brown fox jumped over \nthe lazy dogs, this was the first thing i \nlearns how to type before now",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    ),
                    Row(
                      children: [
                        Text("connect", style: TextStyle(color: Colors.blue),),
                        SizedBox(width: 10,),
                        Text("cancel", style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)
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
