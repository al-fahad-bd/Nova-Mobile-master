import 'package:flutter/material.dart';

class LevelCard extends StatefulWidget {
  final bool currentLevel;
  final String tier;
  const LevelCard({super.key, required this.currentLevel, required this.tier});

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.currentLevel ? Colors.blue[600] : Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.tier,
                  style: TextStyle(
                      color: widget.currentLevel ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Daily Transaction Limit",
                  style: TextStyle(
                    fontSize: 15,
                    color:
                    widget.currentLevel ? Colors.white.withOpacity(0.5) : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 17,
                      width: 17,
                      child: Center(
                        child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png",
                          color: widget.currentLevel ? Colors.white : Colors.blue,
                        ),
                      ),
                    ),
                    Text(
                      "50,000",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: widget.currentLevel ? Colors.white : Colors.blue,
                      ),
                    )
                  ],
                ),
                Text(
                  "Maximum Balance",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color:
                    widget.currentLevel ? Colors.white.withOpacity(0.5) : Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 17,
                      width: 17,
                      child: Center(
                        child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png",
                          color: widget.currentLevel ? Colors.white : Colors.blue,
                        ),
                      ),
                    ),
                    Text(
                      "300,000",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: widget.currentLevel ? Colors.white : Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: widget.currentLevel ? Colors.grey[200] : Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Stack(
                  children: [
                    if (widget.tier == "Tier 1")
                      Image.asset("images/STK-20240102-WA0060.webp")
                    else if (widget.tier == "Tier 2")
                      Image.asset("images/STK-20240102-WA0063.webp")
                    else if (widget.tier == "Tier 3")
                      Image.asset("images/STK-20240102-WA0070.webp")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
