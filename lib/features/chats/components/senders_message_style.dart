import 'package:flutter/material.dart';

class SendersMessageStyle extends StatelessWidget {
  final String senderMessage;
  const SendersMessageStyle({required this.senderMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/5 * 3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.blue[600]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: senderMessage,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ]
                  )
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: Colors.white,size: 10,),
                  ),
                ),
                const SizedBox(width: 2,),
                Text(
                  "12:30AM",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
