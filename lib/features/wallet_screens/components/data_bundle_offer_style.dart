import 'package:flutter/material.dart';

class DataBundleOfferStyle extends StatefulWidget {
  const DataBundleOfferStyle({super.key});

  @override
  State<DataBundleOfferStyle> createState() => _DataBundleOfferStyleState();
}

class _DataBundleOfferStyleState extends State<DataBundleOfferStyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            showModalBottomSheet(context: context, builder: (BuildContext context) {
              return Container();
            });
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "1 Day",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue
                  ),
                ),
                RichText(text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "500",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                    TextSpan(
                        text: "MB",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                        )
                    ),
                  ]
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 13,
                      width: 13,
                      child: Center(
                        child: Image.asset(
                            "images/nigeria-naira-currency-symbol.png"),
                      ),
                    ),
                    const SizedBox(width: 3,),
                    Text(
                      "200",
                      style: TextStyle(
                        fontSize: 13
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Center(
                        child: Image.asset(
                            "images/nigeria-naira-currency-symbol.png",
                          color: Colors.blue[800],),
                      ),
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                          fontSize: 10,
                        color: Colors.blue[800],
                      ),
                    ),
                    Text(
                      " Nova coin",
                      style: TextStyle(
                          fontSize: 10,
                        color: Colors.blue[800],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
