import 'package:flutter/material.dart';

class ReviewCardStyle extends StatelessWidget {
  const ReviewCardStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Container(
        height: 170,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //top section
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
                          shape: BoxShape.circle
                        ),
                        child: Image.asset("images/banner_img2.jpg", fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 5,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "user name",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "20-03-2023",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, size: 15,),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              //review message
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Nice dress, my friends loved it, just to bad that i didn't get a discount",
                      style: TextStyle(
                        color: Colors.grey[600]
                      )
                    ),
                    const TextSpan(
                        text: ".Read more",
                        style: TextStyle(
                            color: Colors.black
                        )
                    )
                  ]
                ),
              ),
              const SizedBox(height: 5,),
              //optional attached image
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
