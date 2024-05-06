import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AchievementsCards extends StatelessWidget {
  const AchievementsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 50,
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[100], shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        IconlyLight.bag_2,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 6,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      "150 Favorites",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8),
                        child: Text(
                          "30 Credits",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50,),
                    const Text(
                      "100%",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        height: 7,
                        width: 284,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),),
                      Container(
                        height: 7,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                        ),)
                    ],
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
