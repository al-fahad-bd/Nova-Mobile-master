import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/screens/designer_collection_preview_screen.dart';

class DesignerCollections extends StatefulWidget {
  final String productImage;
  const DesignerCollections({super.key, required this.productImage});

  @override
  State<DesignerCollections> createState() => _DesignerCollectionsState();
}

class _DesignerCollectionsState extends State<DesignerCollections> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DesignerCollectionPreviewScreen(productImage: widget.productImage,)));
        },
        child: Container(
          height: 180,
          width: 140,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "images/${widget.productImage}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoved = !isLoved;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(isLoved
                                  ? "images/heart_filled.png"
                                  : "images/heart_outlined.png",
                                color: isLoved ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(
                          "New",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Playsuit In Floral",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              SizedBox(
                                height: 14,
                                width: 14,
                                child: Image.asset(
                                    "images/nigeria-naira-currency-symbol.png"),
                              ),
                              const Text(
                                "9,000.00",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
