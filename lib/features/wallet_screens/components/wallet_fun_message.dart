import 'package:flutter/material.dart';

class WalletFunMessage extends StatelessWidget {
  final Image bgImage;
  final String fmTitle;
  final String fmMessage;
  final String fmButtonTitle;
  final VoidCallback onTap;
  const WalletFunMessage({super.key, required this.bgImage, required this.fmTitle, required this.fmMessage, required this.fmButtonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.black),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: bgImage,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      fmTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      fmMessage,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900], elevation: 0),
                        child: Text(
                          fmButtonTitle,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
