import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';

class FoodStoreDealsCard extends StatelessWidget {
  const FoodStoreDealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [

          //message
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deals for Days",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const Text(
                          "Get 0% free delivery fee \non your first order",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13
                          ),
                        ),
                        const Spacer(),
                        SizedBox(height: 40,child: ShopButtons(title: "Learn More", bgColor: Colors.red, textColor: Colors.white, onTap: (){}))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          //delivery fee
          Expanded(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image.asset("images/pngegg (1).png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
