import 'package:flutter/material.dart';

class ReviewBar extends StatelessWidget {
  final String? rates;
  const ReviewBar({super.key, required this.rates});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      child: Row(
        children: [

          //main count
          Expanded(
            flex: 3,
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$rates",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        "out of",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //star count
          Expanded(
            flex: 4,
            child: Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumbersOfStars(numberOfStars: 5),
                  NumbersOfStars(numberOfStars: 4),
                  NumbersOfStars(numberOfStars: 3),
                  NumbersOfStars(numberOfStars: 2),
                  NumbersOfStars(numberOfStars: 1),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5,),
          //rating bar
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RatingProgressBar(),
                  RatingProgressBar(),
                  RatingProgressBar(),
                  RatingProgressBar(),
                  RatingProgressBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingProgressBar extends StatelessWidget {
  const RatingProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Stack(
            children: [
              Container(
                height: 5,
                // width: 180,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 5,
                width: 120,
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

class NumbersOfStars extends StatelessWidget {
  final int numberOfStars;
  const NumbersOfStars({super.key, required this.numberOfStars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int i = 0; i < numberOfStars; i++)
          const Icon(Icons.star, size: 17, color: Colors.orangeAccent,)
      ],
    );
  }
}

