import 'package:flutter/material.dart';

class ReviewBarTWO extends StatelessWidget {
  final String? rates;
  const ReviewBarTWO({super.key, required this.rates});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$rates",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        "out of 5",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingProgressBar(title: "Excellent"),
                  RatingProgressBar(title: "Very good"),
                  RatingProgressBar(title: "Average"),
                  RatingProgressBar(title: "Poor"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RatingProgressBar extends StatelessWidget {
  final String title;
  const RatingProgressBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 12
          ),
        ),
        const SizedBox(width: 5,),
        SizedBox(
          child: Stack(
            children: [
              Container(
                height: 5,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}