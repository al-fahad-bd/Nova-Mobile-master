import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';

class ToNovaRecentTransfer extends StatefulWidget {
  const ToNovaRecentTransfer({super.key});

  @override
  State<ToNovaRecentTransfer> createState() => _ToNovaRecentTransferState();
}

class _ToNovaRecentTransferState extends State<ToNovaRecentTransfer> {

  List rImg = [
    "intro_img.jpg",
    "intro_img1.jpg",
    "intro_img2.jpg",
    "intro_img3.jpg",
    "intro_img4.jpg",
    "item_1.jpg",
    "item_7.jpg",
    "f0d47af5192a592dcf1bdf54fb8fade8.jpg",
    "e06aebbf4057f12db16647aae904210d.jpg",
    "c173b7a22fbf1a195ebddc43b671c778.jpg",
  ];
  List rName = [
    "Nora",
    "Ray",
    "Ella",
    "Cynthia",
    "Amina",
    "Chioma",
    "Emeka",
    "Sufyan",
    "Alaska",
    "Ganzo",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          CircleImage(imageHeight: 50, imageWidth: 50, image: rImg[Random().nextInt(rImg.length)]),
          const SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "type of transaction",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("@${rName[Random().nextInt(rName.length)]}", style: TextStyle(color: Colors.grey[400], fontSize: 13),)
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("images/nigeria-naira-currency-symbol.png"),
                  ),
                  Text("5,000.00")
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.arrow_downward, color: Colors.red, size: 12,),
                  Text("Sent")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
