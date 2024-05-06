import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/food/screens/recipe_view_screen.dart';

class RecipeCard extends StatelessWidget {
  final String recipeImage;
  final String recipeTitle;
  final String recipeTime;
  final String recipeAuthor;
  final String recipeRatingData;

  const RecipeCard(
      {super.key,
      required this.recipeImage,
      required this.recipeTitle,
      required this.recipeTime,
      required this.recipeAuthor,
      required this.recipeRatingData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeViewScreen(
                        recipeImage: recipeImage,
                        recipeTime: recipeTime,
                        recipeAuthor: recipeAuthor,
                        recipeRatingData: recipeRatingData,
                        recipeTitle: recipeTitle,
                      )));
        },
        child: Container(
          height: 200,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "images/$recipeImage",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 15,
                                ),
                                Text("$recipeRatingData (1k+ Reviews)")
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.8)),
                            icon: const Icon(IconlyBold.heart))
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                recipeTitle,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Center(
                                    child: Icon(
                                  IconlyLight.download,
                                  color: Colors.white,
                                  size: 15,
                                )),
                              ),
                            ],
                          ),
                          Text(
                            "$recipeTime * Easy * $recipeAuthor",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
