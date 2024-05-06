import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/bank_list_style.2.dart';
import 'package:nova_mobile/features/wallet_screens/components/bank_list_style_1.dart';

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({super.key});

  @override
  State<TransferToBankScreen> createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  final searchForBank = TextEditingController();
  final listOfBanks = [];
  int initialItem = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void onPageChange(int index) {
    setState(() {
      initialItem = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Bank",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                onPageChanged: onPageChange,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          itemCount: 6,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                            return const BankListStyleOne();
                            }
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 2; i++)
                  if (initialItem == i)
                    DotIndicator(isActive: true)
                else
                  DotIndicator(isActive: false)
              ],
            ),
            const SizedBox(height: 15,),
            SearchSpace(controller: searchForBank, prefixIcon: const Icon(IconlyLight.search, color: Colors.grey,), hintText: "search banks"),
            const SizedBox(height: 15,),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: 50,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return BankListStyleTwo();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
