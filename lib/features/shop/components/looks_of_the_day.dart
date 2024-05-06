import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LooksOfTheDay extends StatelessWidget {
  const LooksOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      // Number of columns
      itemCount: 3,
      // Number of items
      itemBuilder: (BuildContext context, int index) => YourItemWidget(index),
      // Start index from 1
      staggeredTileBuilder: (int index) {
        if (index == 0) {
          return const StaggeredTile.count(1, 2); // Big tile for the first item
        } else {
          return const StaggeredTile.count(1, 1); // Two small tiles for the remaining items
        }
      },
      mainAxisSpacing: 0.0, // Vertical spacing
      crossAxisSpacing: 0.0, // Horizontal spacing
    );
  }
}

class YourItemWidget extends StatelessWidget {
  final int index;
  final List<String> imageUrls = [
    'https://as1.ftcdn.net/v2/jpg/05/09/62/76/1000_F_509627606_8RTqBbmIlZ5yXy3jaehT2pllpw1dXPT5.jpg',
    'https://img.freepik.com/premium-photo/beautiful-girl-model-posing-dress_713163-2.jpg',
    'https://thumbs.dreamstime.com/b/gold-woman-flying-dress-fashion-model-waving-golden-gown-fluttering-fabric-fly-like-wings-art-beauty-portrait-112190948.jpg',
    // Add more image URLs as needed
  ];

  YourItemWidget(this.index);

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

    return Card(
      color: Colors.grey[200],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: (index == 1) ? 220.0 : 150.0,
          height: (index == 1) ? 220.0 : 150.0,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}