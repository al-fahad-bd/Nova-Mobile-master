import 'package:flutter/material.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';

class StoreManagerReviewStyle extends StatelessWidget {
  const StoreManagerReviewStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleImage(imageHeight: 40, imageWidth: 40, image: "0d2569fa15d54f392b77c48adfc46d68.jpg"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name of user",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "@username",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: const Center(
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.orangeAccent, size: 19,),
                          const SizedBox(width: 5,),
                          Text("3")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              "wertyuioplkjhgfdsazxcvbnmopoiuytrewsdffffffffffffffffffffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhffffffffffffffffffffffffffffffffff",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14
              ),
            ),
            const SizedBox(height: 5,),
            const Row(
              children: [
                Text("20min ago", style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
