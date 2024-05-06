import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/wallet_screens/components/data_bundle_offer_style.dart';
import 'package:nova_mobile/features/wallet_screens/components/enter_phone_number_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/phone_number_space.dart';

class BuyDataScreen extends StatefulWidget {
  const BuyDataScreen({super.key});

  @override
  State<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends State<BuyDataScreen> {
  final enterDataPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Bundles"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: DefaultTabController(
          length: 8,
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image.asset("images/3d-casual-life-woman-talking-with-chatbot.png"),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Nova Coin",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.grey),
                                    shape: BoxShape.circle
                                  ),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: RichText(text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "N",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13
                                            )
                                          ),
                                          TextSpan(
                                              text: "c",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                fontSize: 10
                                              )
                                          ),
                                        ]
                                      ),)
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                                "Get nova coins on each of your \ndata purchase to get better discounts \non your next data bundle \npurchase.",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: EnterPhoneNumberSpace(
                    controller: enterDataPhoneNumberController, onClick: () {}),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Running low on data, don't worry we've got you covered, type in the phone number you wont to subscribe to and selected any data bundle of your choice.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.blue[800],
                labelColor: Colors.blue[800],
                unselectedLabelColor: Colors.grey,
                dividerHeight: 0,
                tabs: const [
                  Tab(
                    text: "Best Offers",
                  ),
                  Tab(
                    text: "Daily",
                  ),
                  Tab(
                    text: "Weekly",
                  ),
                  Tab(
                    text: "Monthly",
                  ),
                  Tab(
                    text: "Yearly",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Best offers
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, int index) {
                        return const DataBundleOfferStyle();
                      },
                    ),

                    //Daily offers
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, int index) {
                        return const DataBundleOfferStyle();
                      },
                    ),

                    //Weekly offers
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, int index) {
                        return const DataBundleOfferStyle();
                      },
                    ),

                    //Monthly offers
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, int index) {
                        return const DataBundleOfferStyle();
                      },
                    ),

                    //Yearly offers
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, int index) {
                        return const DataBundleOfferStyle();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
