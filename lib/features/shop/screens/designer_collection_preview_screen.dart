import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/shop/comon_screen/cart_screen.dart';

class DesignerCollectionPreviewScreen extends StatefulWidget {
  final String productImage;
  const DesignerCollectionPreviewScreen({super.key, required this.productImage});

  @override
  State<DesignerCollectionPreviewScreen> createState() => _DesignerCollectionPreviewScreenState();
}

class _DesignerCollectionPreviewScreenState extends State<DesignerCollectionPreviewScreen> {
  bool isLoved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/${widget.productImage}", fit: BoxFit.cover,),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1)
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey[200]
                          ),
                            icon: const Icon(Icons.arrow_back),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.grey[200]
                              ),
                              icon: const Icon(IconlyLight.bag),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isLoved = !isLoved;
                                });
                              },
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.white),
                              icon: isLoved
                                  ? SizedBox(
                                height: 25,
                                width: 25,
                                child: Center(
                                  child: Image.asset(
                                    "images/heart_filled.png",
                                    color: Colors.red,
                                  ),
                                ),
                              )
                                  : SizedBox(
                                height: 25,
                                width: 25,
                                child: Center(
                                  child: Image.asset(
                                    "images/heart_outlined.png",
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Image.asset("images/${widget.productImage}", fit: BoxFit.cover,),
                                ),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Laminated",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        "Louis Vuitton",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[800]
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "product collection description will be displayed here",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[800]
                                              )
                                            )
                                          ]
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 17,
                                      width: 17,
                                      child: Image.asset("images/nigeria-naira-currency-symbol.png"),
                                    ),
                                    const Text(
                                      "9,000.00",
                                      style: TextStyle(
                                          fontSize: 17
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    onPressed: () {},
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    icon: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                        "images/add-to-cart.png",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
