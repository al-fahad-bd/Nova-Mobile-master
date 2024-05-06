import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/shared_components/feature_tag.dart';

class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Text(
              "Fund Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Easily fund your account with any of the provided method in just seconds.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.06)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bank Transfer",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text(
                      "Receive funds from any local bank",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 35,
                        width: 83,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Row(
                            children: [
                              Icon(Icons.share, color: Colors.blue, size: 19,),
                              SizedBox(width: 4,),
                              Text(
                                "Share",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Account Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                          ),
                        ),
                        const SizedBox(width: 4,),
                        Container(
                         height: 7,
                         width: 7,
                         decoration: const BoxDecoration(
                           color: Colors.grey,
                           shape: BoxShape.circle
                         ),
                        ),
                        const SizedBox(width: 4,),
                        Text(
                          "Bank Name",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "Account Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.06)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        shape: BoxShape.circle
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Top-up with card",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(width: 3,),
                            FeatureTag(title: "coming soon", titleColor: Colors.red, tagColor: Colors.red)
                          ],
                        ),
                        Text(
                          "Easily fund your account from any \nof your cards.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13
                          ),
                        ),
                      ],
                    ),
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
