import 'package:flutter/material.dart';

class CardHistoryStyle extends StatelessWidget {
  const CardHistoryStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 5,),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "transaction title",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "category",
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        fontSize: 17
                      ),
                    )
                  ],
                )
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "50000"
                ),
                Text(
                  "date and time",
                  style: TextStyle(
                    color: Colors.grey
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
