import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/components/category_style.dart';

class BrandCategory extends StatefulWidget {
  const BrandCategory({super.key});

  @override
  State<BrandCategory> createState() => _BrandCategoryState();
}

class _BrandCategoryState extends State<BrandCategory> {
  List listOfCategory = [
    "Adidas",
    "Dior",
    "Prada",
    "Louis Vuitton",
    "Versace",
    "Gucci",
    "Jordan",
    "Nike",
    "Puma",
  ];
  List listOfCatImage = [
    "adidas-puma-logo-shoe-sportswear-adidas-6cf45396a0f37ea024ec5d1fd75d7512.png",
    "5bbc0cfbe3ece-cf7c8ab715a7f0b2688c53c3a86ee2fb.png",
    "chanel-logo-prada-brand-clip-art-p-vector-ab22840c7d713839293a8dd999f3e9f0.png",
    "chanel-louis-vuitton-logo-luxury-goods-chanel-145e4fddb779a222fc5f53a4358d8bab.png",
    "donatella-versace-versace-usa-inc-logo-fashion-dior-logo-413fe5ec9662a787dd444ca1c8ed0cc9.png",
    "gucci-logo-clip-art-fashion-brand-bart-gucci-430f08af955267a4547baeba7719ffa6.png",
    "jumpman-t-shirt-air-jordan-logo-nike-michael-jordan-e62b189d53b535868095c30dd89764c1.png",
    "nike-just-do-it-swoosh-logo-brand-nike-logo-free-png-image-0b97ead7f6104e90b9fea674d7594be1.png",
    "puma-logo-adidas-swoosh-brand-adidas-c11abcf03fa753865eb60a5b9d81ca05.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: listOfCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CateGoryStyle(categoryTitle: listOfCategory[index], categoryImage: listOfCatImage[index],);
        },
      ),
    );
  }
}

