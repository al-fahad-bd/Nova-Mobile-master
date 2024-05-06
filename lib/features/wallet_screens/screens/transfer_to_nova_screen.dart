import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/recent_nova_members_transfer_display_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/to_nova_recent_transfer.dart';

class TransferToNovaScreen extends StatefulWidget {
  const TransferToNovaScreen({super.key});

  @override
  State<TransferToNovaScreen> createState() => _TransferToNovaScreenState();
}

class _TransferToNovaScreenState extends State<TransferToNovaScreen> {
  final searchNovaMembersTransfer = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Nova"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: const Center(
                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                 const  Text(
                    "Make new tranfer",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            SearchSpace(
                controller: searchNovaMembersTransfer,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search for members"),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transfer"),
                Text("see all"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: rImg.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return RecentNovaMemberTransferDisplayStyle(userName: rName[Random().nextInt(rName.length)], userImg: rImg[Random().nextInt(rImg.length)],);
                },
              ),
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Nova Transactions"
                ),
                Text("over view"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const ToNovaRecentTransfer();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
