import 'package:flutter/material.dart';

class SenderImageStyle extends StatelessWidget {
  const SenderImageStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 250,
            width: 180,
            child: Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: 180,
                  child: Image.asset("images/item_1.jpg", fit: BoxFit.cover,),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1)
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0, bottom: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "12:30AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
