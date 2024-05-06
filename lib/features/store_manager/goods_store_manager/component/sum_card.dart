import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SumCard extends StatelessWidget {
  final String title;
  final String countValue;
  final String grade;
  final bool rateDirection;
  const SumCard({super.key, required this.title, required this.countValue, required this.grade, required this.rateDirection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.3)
                    ),
                    child: const Center(
                      child: Icon(IconlyBold.profile, color: Colors.black,),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.grey,
                          fontSize: title.length > 14 ? 11 : 15
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            countValue,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 23
                            ),
                          ),
                          Text(
                            " ${rateDirection ? "+" : "-"}$grade%",
                            style: TextStyle(
                                color: rateDirection ? Colors.green : Colors.red
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
