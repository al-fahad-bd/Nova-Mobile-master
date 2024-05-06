import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/food/screens/food_store_view_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';

class FoodStoreDisplayCardOne extends StatelessWidget {
  final String restaurantImage;
  final String restaurantLocation;
  final String restaurantRatingData;
  final String restaurantName;
  const FoodStoreDisplayCardOne({super.key, required this.restaurantImage, required this.restaurantLocation, required this.restaurantRatingData, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FoodStoreViewScreen(restaurantImage: restaurantImage, restaurantLocation: restaurantLocation, restaurantRatingData: restaurantRatingData, restaurantName: restaurantName,)));
        },
        child: Container(
          height: 200,
          width: 250,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Image.asset("images/$restaurantImage", fit: BoxFit.cover,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 115,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantName,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(IconlyBold.location, size: 13, color: Colors.red,),
                                  Text(
                                    restaurantLocation,
                                    style: const TextStyle(
                                        fontSize: 9
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                      "Rating: ",
                                    style: TextStyle(
                                      fontSize: 9
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          restaurantRatingData,
                                        style: TextStyle(
                                          fontSize: 9
                                        ),
                                      ),
                                      const Icon(Icons.star, color: Colors.yellowAccent,size: 12,)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Manager:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                              fontSize: 11
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleImage(imageHeight: 32, imageWidth: 32, image: "banner_img.jpg"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "name of user",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    "@username",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 10
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
