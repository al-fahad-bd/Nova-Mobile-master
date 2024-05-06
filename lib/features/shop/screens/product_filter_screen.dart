import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/components/product_available_colors.dart';
import 'package:nova_mobile/features/shop/components/producttype_brand_selector.dart';
import 'package:nova_mobile/features/shop/components/productype_filter_style.dart';

class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Apply Filter", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                //product category
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text("See All", style: TextStyle(color: Colors.grey, fontSize: 12),)
                  ],
                ),
                SizedBox(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  child: const ProductTypeFilterStyle(),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Brands",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const ProductTypeBrandSelector(),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const ProductAvailableColor()
              ],
            ),
          )
        ],
      ),
    );
  }
}
