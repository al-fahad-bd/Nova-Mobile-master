import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/screens/cards_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/buy_airtime_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/buy_data_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/buy_electricity.dart';
import 'package:nova_mobile/features/wallet_screens/screens/games_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/tv_recharge_screen.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //airtime
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BuyAirtimeScreen()));
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                              "images/phone_slip.png")),
                    ),
                  ),
                ),
                const Text("Airtime")
              ],
            ),
            //data
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BuyDataScreen()));
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/3d-casual-life-earth-planet-icon-1.png")),
                    ),
                  ),
                ),
                const Text("Data")
              ],
            ),
            //electricity
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BuyElectricity()));
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/3d-casual-life-ecology-lightbulb.png")),
                    ),
                  ),
                ),
                const Text("Electricity")
              ],
            ),
            //games
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GamesScreen()));
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/casual-life-3d-game-controller.png")),
                    ),
                  ),
                ),
                const Text("Games")
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CardsScreen()));
                    });
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/3d-casual-life-credit-cards-and-pie-chart.png")),
                    ),
                  ),
                ),
                const Text("Cards")
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TVRechargeScreen()));
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/3d-business-side-view-computer-monitor-2.png")),
                    ),
                  ),
                ),
                const Text("TV")
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming Soon")));
                    });
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/casual-life-3d-wifi.png")),
                    ),
                  ),
                ),
                const Text("Internet")
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming Soon")));
                    });
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[10],
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "images/casual-life-3d-yellow-padlock-with-key.png")),
                    ),
                  ),
                ),
                const Text("Lock Up")
              ],
            ),
          ],
        ),
      ],
    );
  }
}
