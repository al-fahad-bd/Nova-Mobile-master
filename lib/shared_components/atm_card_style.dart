import 'package:flutter/material.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/settings/cards%20transaction/card_one_transaction.dart';
import 'package:nova_mobile/features/settings/cards%20transaction/card_two_transaction.dart';
import 'package:nova_mobile/features/settings/cards%20transaction/card_zero_transaction.dart';



class ATMCards extends StatefulWidget {
  const ATMCards({super.key});

  @override
  State<ATMCards> createState() => _ATMCardsState();
}

class _ATMCardsState extends State<ATMCards> {
  int currentCard = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void onCardChanged(int index) {
    setState(() {
      currentCard = index;
    });
  }

  void cardsTransaction() {
    setState(() {
      switch(currentCard) {
        case 0:
          CardZeroTransaction();
          break;
        case 1:
          CardOneTransaction();
          break;
        case 2:
          CardTwoTransaction();
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Saved Cards",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: 3,
            onPageChanged: onCardChanged,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const ATMCardsStyle();
            },
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              if (currentCard == i)
                BannerIndicator(isActive: true, indicatorColor: Colors.blue)
            else
              BannerIndicator(isActive: false, indicatorColor: Colors.grey)
          ],
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.shuffle))
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: 800,
                      child: PageView(
                        children: [
                          for (int i = 0; i < 3; i++)
                            if (currentCard == 0)
                              CardZeroTransaction()
                            else if (currentCard == 1)
                              CardOneTransaction()
                            else if (currentCard == 2)
                                CardTwoTransaction()
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


class ATMCardsStyle extends StatelessWidget {
  const ATMCardsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40)
        ),
      ),
    );
  }
}
