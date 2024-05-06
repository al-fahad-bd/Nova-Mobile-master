import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/settings/components/level_card.dart';

class AccountLevelScreen extends StatefulWidget {
  const AccountLevelScreen({super.key});

  @override
  State<AccountLevelScreen> createState() => _AccountLevelScreenState();
}

class _AccountLevelScreenState extends State<AccountLevelScreen> {
  int initialLevelCard = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onCardSwiped(int index) {
    setState(() {
      initialLevelCard = index;
    });
  }

  List isActive = [
    true,
    false,
    false,
  ];
  List tiers = [
    "Tier 1",
    "Tier 2",
    "Tier 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Level"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "My Level: ",
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                    TextSpan(
                        text: "Tier 1",
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                  ]),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        height: 5,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 170,
            child: PageView.builder(
              itemCount: 3,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: onCardSwiped,
              itemBuilder: (context, int index) {
                return LevelCard(
                  currentLevel: isActive[index],
                  tier: tiers[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                if (i == initialLevelCard)
                  const BannerIndicator(
                    isActive: true,
                    indicatorColor: Colors.blue,
                  )
                else
                  const BannerIndicator(
                    isActive: false,
                    indicatorColor: Colors.grey,
                  )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: CustomDefaultButton(title: "Upgrade", onTap: () {}),
          )
        ],
      ),
    );
  }
}
