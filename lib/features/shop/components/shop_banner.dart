import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';

class ShopBanner extends StatefulWidget {
  const ShopBanner({super.key});

  @override
  State<ShopBanner> createState() => _ShopBannerState();
}

class _ShopBannerState extends State<ShopBanner> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChange(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: PageView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: onPageChange,
            itemBuilder: (BuildContext context, int index) {
              return ShopCollections(index);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 10; i++)
                if (currentPage == i)
                  const BannerIndicator(isActive: true, indicatorColor: Colors.white,)
                else
                  const BannerIndicator(isActive: false, indicatorColor: Colors.white,)
            ],
          ),
        ),
      ],
    );
  }
}

class ShopCollections extends StatelessWidget {
  ShopCollections(this.index);

  final int index;
  final List<String> imageUrls = [
    "banner_img.jpg",
    "sample_food27.jpg",
    "banner_img4.jpg",
    "sample_rest1.jpg",
    "banner_img2.jpg",
    "sample_food16.jpg",
    "sample_food2.jpg",
    "sample_rest6.jpg",
    "sample_food33.jpg",
    "sample_food22.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    String imageUrl;

    if (index == 0) {
      // For the big card, use a random image from the list
      imageUrl = imageUrls[Random().nextInt(imageUrls.length)];
    } else {
      // For the small cards, use the first two images from the list
      imageUrl = imageUrls[index - 1];
    }
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "images/$imageUrl",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Spring Collection",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 3,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const Text(
                            "30% OFF",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "the first transaction",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
