import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/wallet_screens/components/games_amount_card.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  final userGameIDController = TextEditingController();
  final enterGamesAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Games"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Provider",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text(
                                "SportyBet"
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_right, color: Colors.grey,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 105,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Feeling generous?",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(
                          "How about a little giveaway to start with.",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey
                          ),
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Center(
                              child: Text(
                                "Giveaway",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Image.asset("images/casual-life-3d-using-smartphone-to-shop-for-gifts.png")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "User ID",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    TextSpace(obscureText: false, controller: userGameIDController, hintText: "0000000000", prefixIcon: null, suffixIcon: null),
                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Amount",
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                        SizedBox(
                          height: 153,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                            itemCount: 6,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 75),
                            itemBuilder: (BuildContext context, int index) {
                              return const GamesAmountCard();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text("Amount"),
            TextSpace(obscureText: false, controller: enterGamesAmountController, hintText: "Enter amount", prefixIcon: null, suffixIcon: null),
            const SizedBox(height: 10,),
            CustomDefaultButton(title: "Pay", onTap: (){})
          ],
        ),
      ),
    );
  }
}
