import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class YourConnectionDisplayStyle extends StatelessWidget {
  const YourConnectionDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "images/banner_img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "name of user",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Software Engineer",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_horiz, color: Colors.grey,),
            )
          ],
        ),
      ),
    );
  }
}
