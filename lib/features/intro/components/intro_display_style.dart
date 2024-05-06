import 'package:flutter/material.dart';

class IntroDisplayStyle extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subMeesage;
  const IntroDisplayStyle({super.key, required this.imgUrl, required this.title, required this.subMeesage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset("images/$imgUrl", fit: BoxFit.cover,),
          ),
          const SizedBox(height: 10,),
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
          Text(
            subMeesage,
              textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
