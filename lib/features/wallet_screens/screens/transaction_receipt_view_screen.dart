import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/shared_components/circle_image_two.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';

class TransactionReceiptViewScreen extends StatefulWidget {
  const TransactionReceiptViewScreen({super.key});

  @override
  State<TransactionReceiptViewScreen> createState() => _TransactionReceiptViewScreenState();
}

class _TransactionReceiptViewScreenState extends State<TransactionReceiptViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receipt"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Share", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      shape: BoxShape.circle
                    ),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 28,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Transaction Successful",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height:20,),
                  const Row(
                    children: [
                      CircleImageTwo(imageHeight: 50, imageWidth: 50, image: "banner_img2.jpg", status: false,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name of user", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),),
                          Text("@username", style: TextStyle(
                              fontSize: 14,
                            color: Colors.grey
                          ),)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const DetailsBreakDown(detailTitle: "Receiver's Name", detailSubTitle: "Demo User"),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Amount",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: Image.asset(
                                  "images/nigeria-naira-currency-symbol.png", color: Colors.blue,),
                            ),
                          ),
                          const Text(
                            "50000",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const DetailsBreakDown(detailTitle: "Bank Name", detailSubTitle: "Access Bank"),
                  const SizedBox(height: 30,),
                  const DetailsBreakDown(detailTitle: "Account Number", detailSubTitle: "000000000"),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Fee",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: Image.asset(
                                "images/nigeria-naira-currency-symbol.png", color: Colors.blue,),
                            ),
                          ),
                          const Text(
                            "10.00",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const DetailsBreakDown(detailTitle: "Sender's Name", detailSubTitle: "Demo User2"),
                  const SizedBox(height: 30,),
                  const DetailsBreakDown(detailTitle: "Transaction Date", detailSubTitle: "Jan 11, 2024. 11:30AM"),
                  const SizedBox(height: 30,),
                  const DetailsBreakDown(detailTitle: "Transaction Reference", detailSubTitle: "lkdbfsisudfowqfe"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsBreakDown extends StatelessWidget {
  final String detailTitle;
  final String detailSubTitle;
  const DetailsBreakDown({super.key, required this.detailTitle, required this.detailSubTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        ),
        Text(
          detailSubTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}
