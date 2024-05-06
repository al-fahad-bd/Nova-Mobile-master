import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/comon_screen/write_review_screen.dart';
import 'package:nova_mobile/features/shop/components/review_bar.dart';
import 'package:nova_mobile/features/shop/components/review_bar_two.dart';
import 'package:nova_mobile/features/shop/components/review_card_style.dart';

class ProductReviewScreen extends StatefulWidget {
  final String reviewData;
  const ProductReviewScreen({super.key, required this.reviewData});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            ReviewBarTWO(rates: widget.reviewData),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const ReviewCardStyle();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteReviewScreen()));
      }, backgroundColor: Colors.blue, child: const Icon(IconlyLight.edit, color: Colors.white,),),
    );
  }
}
