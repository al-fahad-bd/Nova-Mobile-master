import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';

class RecipeViewScreen extends StatefulWidget {
  final String recipeImage;
  final String recipeTitle;
  final String recipeTime;
  final String recipeAuthor;
  final String recipeRatingData;

  const RecipeViewScreen(
      {super.key,
      required this.recipeImage,
      required this.recipeTime,
      required this.recipeAuthor,
      required this.recipeRatingData,
      required this.recipeTitle});

  @override
  State<RecipeViewScreen> createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  List items = [
    "item 1",
    "item 2",
    "item 3",
    "item 4",
  ];
  String selectedImage = '';
  int initialServing = 1;
  String demoMessage = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis massa in nulla condimentum, nec mattis massa tristique. Aenean sit amet rhoncus lorem, id maximus eros. Aenean varius purus a blandit blandit. Phasellus cursus elit nisi, at pulvinar enim viverra eu. Vivamus gravida, mi ac pellentesque vulputate, neque nulla tempor diam, in eleifend diam turpis ac elit. Integer et libero lectus. Proin metus neque, viverra ac congue in, viverra quis lacus. Sed malesuada quis elit fermentum maximus. In a turpis vel libero suscipit consectetur eu et massa. Nullam cursus interdum ultricies. Sed dignissim eros eget sapien mollis euismod sed a ligula. Phasellus tempor nunc sapien, non venenatis nulla aliquam quis. Donec pretium consequat consequat. Morbi ac aliquet quam, non sodales enim. Aliquam pulvinar ut leo eu aliquam. Phasellus ultricies condimentum porttitor. Sed lacinia tortor metus, nec interdum metus tristique suscipit. Ut vitae mi sed quam porta facilisis. Vivamus viverra libero et enim tincidunt, ac pulvinar mauris tincidunt. Nullam et risus eu felis consectetur ullamcorper non nec risus. Fusce aliquam, augue eget eleifend rutrum, nunc diam dictum dolor, vitae fermentum risus nisl ac ex. Sed urna ipsum, tempor et lectus id, finibus vestibulum mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla in risus sodales, tincidunt mauris eget, scelerisque diam.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 350,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            width: double.infinity,
            child: Image.asset(
              "images/${widget.recipeImage}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 290,
            width: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: IconButton.styleFrom(
                                fixedSize: const Size(40, 40), backgroundColor: Colors.white.withOpacity(0.8)),
                            icon: const Icon(Icons.arrow_back)),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    fixedSize: const Size(40, 40), backgroundColor: Colors.white.withOpacity(0.8)),
                                icon: const Icon(IconlyLight.heart)),
                            IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    fixedSize: const Size(40, 40), backgroundColor: Colors.white.withOpacity(0.8)),
                                icon: const Icon(Icons.share))
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Image.asset("images/sample_food.jpg", fit: BoxFit.cover,),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Pasta",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 16,
                                ),
                                Text(widget.recipeRatingData),
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
                            Text(
                              widget.recipeTitle,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Recipe by",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleImage(
                                    imageHeight: 50,
                                    imageWidth: 50,
                                    image: "banner_img2.jpg"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.recipeAuthor,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Text(
                                      "@username",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                icon: const Icon(
                                  IconlyLight.message,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //description
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        ReadMoreText(longText: demoMessage, maxLength: 150,),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 63,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.3))),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          IconlyLight.time_circle,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Cooking Time",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${widget.recipeTime} min",
                                            style: const TextStyle(
                                                color: Colors.red),
                                          )
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
                            Expanded(
                              child: Container(
                                height: 63,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.3))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          IconlyLight.notification,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Cuisine",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Italian",
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),

                        //ingredient
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Ingredient",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    if (initialServing == 1) {
                                      initialServing = 1;
                                    } else {
                                      setState(() {
                                        initialServing -=1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 15.0),
                                        child: Icon(Icons.minimize, color: Colors.white, size: 15,),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                    "$initialServing serving"
                                ),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      initialServing +=1;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.add, color: Colors.white, size: 15,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: items.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                              "${items[index]}"
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.0)
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(360)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle, color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              const Text(
                "Watch Tutorial",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
