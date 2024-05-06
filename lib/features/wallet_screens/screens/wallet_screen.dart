import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/wallet_screens/components/quick_action_button.dart';
import 'package:nova_mobile/features/wallet_screens/components/quick_actions_component.dart';
import 'package:nova_mobile/features/wallet_screens/components/wallet_fun_message.dart';
import 'package:nova_mobile/features/wallet_screens/screens/finance_notification_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/fund_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/give_away_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/nova_member_send_money_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transaction_history_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transfer_to_bank.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transfer_to_bank_beneficiary_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/transfer_to_nova_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';
import 'package:provider/provider.dart';

import '../../../services/user_provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isVisible = true;
  String isClicked = "";
  int currentFunMessage = 0;
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
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange(int index) {
    setState(() {
      currentFunMessage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Row(
            children: [
              const CircleImage(imageHeight: 38, imageWidth: 38, image: "banner_img.jpg"),
              Container(
                width: 85,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 4, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.bankName,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        user.accountNumber,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FinanceNotificationScreen()));
                      },
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("images/bell.png"),
                      )),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Account Balance",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: Image.asset(
                                "images/nigeria-naira-currency-symbol.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionHistoryScreen()));
                          },
                          child: Text(
                            isVisible ? "21,667.54" : "*******",
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: Image.asset(
                                      "images/feather_eye.png",
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: Image.asset(
                                      "images/feather_eye_off.png",
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //quick action button
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuickActionButton(icon: Image.asset("images/profile-connections-outlined.png"), title: "To Nova", onClick: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferToNovaScreen()));
                          }),
                          QuickActionButton(icon: Image.asset("images/exchange (1).png"), title: "To Bank", onClick: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferToBankBeneficiaryScreen()));
                          }),
                          QuickActionButton(icon: Image.asset("images/exchange.png"), title: "Convert", onClick: (){}),
                          QuickActionButton(icon: Image.asset("images/feather_download.png"), title: "Fund", onClick: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FundScreen()));
                          }),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),


                    //invite friends
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(17)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                                "make sure to go to your settings and set \na transaction pin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(
                              height: 35,
                                width: 35,
                                child: Image.asset("images/casual-life-3d-megaphone.png"))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    //quick actions
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quick Send",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //quick send
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      shape: BoxShape.circle
                                    ),
                                    child: const Center(child: Icon(IconlyLight.search, color: Colors.grey,),),
                                  ),
                                  const Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: ListView.builder(
                                itemCount: rImg.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return TitledCircleImage(imageHeight: 50, imageWidth: 50, image: rImg[index], imageTitle: rName[index], onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => NovaMemberSendMoneyScreen(username: rName[index], userImg: rImg[index])));
                                  },);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quick actions",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //quick actions
                    const QuickActions(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GiveAwayScreen()));
          },
          backgroundColor: Colors.blue,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("images/give-away-image.png"),
          ),
        ));
  }
}
