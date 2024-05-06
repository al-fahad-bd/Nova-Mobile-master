import 'package:flutter/material.dart';

class WeeklyHighlight extends StatelessWidget {
  const WeeklyHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFCFCFCF), width: 1)),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image.network(
              "https://i.pinimg.com/736x/d7/9e/21/d79e21cffdca5ab5bca55f9498168896.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),

          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //title
                Text(
                  "Louis vuitton",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Emblematic Star Trail",
                  style: TextStyle(color: Colors.grey),
                ),
                Text("face cap", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


