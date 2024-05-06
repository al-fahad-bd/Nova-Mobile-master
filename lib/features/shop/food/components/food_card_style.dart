import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/food/screens/food_view_screen.dart';

class FoodCardStyle extends StatelessWidget {
  final String foodImage;
  const FoodCardStyle({super.key, required this.foodImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FoodViewScreen(foodImage: foodImage,)));
        },
        child: Container(
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.0),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                ),
                child: Image.asset("images/$foodImage", fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "food name",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13,
                          width: 13,
                          child: Image.asset(
                              "images/nigeria-naira-currency-symbol.png", color: Colors.blue,),
                        ),
                        const Text(
                          "1,222",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ],
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
