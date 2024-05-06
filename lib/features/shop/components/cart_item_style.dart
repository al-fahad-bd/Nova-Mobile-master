import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../model/product_model.dart';
import '../../../services/cart_services.dart';
import '../../../services/user_provider.dart';

class CartItemStyle extends StatefulWidget {
  final String productImage;

  const CartItemStyle({super.key, required this.productImage});

  @override
  State<CartItemStyle> createState() => _CartItemStyleState();
}

class _CartItemStyleState extends State<CartItemStyle> {
  int productQuantity = 1;

  // final ProductDetailsServices productDetailsServices =
  //     ProductDetailsServices();
  // final CartServices cartServices = CartServices();
  //
  // void increaseQuantity(Product product) {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: product,
  //   );
  // }
  //
  // void decreaseQuantity(Product product) {
  //   cartServices.removeFromCart(
  //     context: context,
  //     product: product,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final productCart =
    //     context.watch<UserProvider>().userModel.cart[widget.index];
    // final product = Product.fromMap(productCart['product']);
    // final quantity = productCart['quantity'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "products/${widget.productImage}",
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),

                //product details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Text(
                      "Review (4.9)",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            "images/nigeria-naira-currency-symbol.png",
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "23,000.00",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  IconlyLight.delete,
                  color: Colors.red,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (productQuantity == 1) {
                            productQuantity = 1;
                          } else {
                            productQuantity -= 1;
                          }
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: productQuantity == 1
                                ? Colors.grey[200]
                                : Colors.red,
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          "$productQuantity",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          productQuantity += 1;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
