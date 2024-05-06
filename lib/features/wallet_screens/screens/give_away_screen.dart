import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';

class GiveAwayScreen extends StatefulWidget {
  const GiveAwayScreen({super.key});

  @override
  State<GiveAwayScreen> createState() => _GiveAwayScreenState();
}

class _GiveAwayScreenState extends State<GiveAwayScreen> {
  String _formatNumber(int number) {
    NumberFormat formatter = NumberFormat("#,###");
    return formatter.format(number);
  }
  TimeOfDay _selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
  int giveAwayAmount = 0;
  String giveAwayCategory = "";
  int giveAwayNumberOfWinners = 0;
  List rImg = [
    "intro_img.jpg",
    "intro_img1.jpg",
    "intro_img2.jpg",
    "intro_img3.jpg",
    "intro_img4.jpg",
    "item_1.jpg",
    "item_7.jpg",
    "f0d47af5192a592dcf1bdf54fb8fade8.jpg",
    "e06aebbf4057f12db16647aae904210d.jpg",
    "c173b7a22fbf1a195ebddc43b671c778.jpg",
  ];
  List rName = [
    "Nora",
    "Ray",
    "Ella",
    "Cynthia",
    "Amina",
    "Chioma",
    "Emeka",
    "Sufyan",
    "Alaska",
    "Ganzo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Giveaway"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "How Much do you want to share?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (giveAwayAmount == 0) {
                      giveAwayAmount = 0;
                    } else {
                      giveAwayAmount -= 100;
                    }
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("-"),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: Image.asset(
                          "images/nigeria-naira-currency-symbol.png"),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$giveAwayAmount",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 30)),
                      TextSpan(
                          text: giveAwayAmount == 0 ? "" : ".0",
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 20)),
                    ]),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    giveAwayAmount += 100;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("+"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Column(
              children: [
                const Text(
                  "Select giveaway time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        _selectedTime.format(context),
                        style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Category",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "From Connections",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        giveAwayCategory = "From Connections";
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: giveAwayCategory == "From Connections"
                                  ? 2
                                  : 1,
                              color: giveAwayCategory == "From Connections"
                                  ? Colors.blue
                                  : Colors.grey)),
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: giveAwayCategory == "From Connections"
                                  ? Colors.blue
                                  : Colors.transparent),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Send Randomly",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        giveAwayCategory = "Send Randomly";
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: giveAwayCategory == "Send Randomly"
                                  ? 2
                                  : 1,
                              color: giveAwayCategory == "Send Randomly"
                                  ? Colors.blue
                                  : Colors.grey)),
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: giveAwayCategory == "Send Randomly"
                                  ? Colors.blue
                                  : Colors.transparent),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Select Number of winners",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (giveAwayNumberOfWinners == 0) {
                      giveAwayNumberOfWinners = 0;
                    } else {
                      giveAwayNumberOfWinners -= 1;
                    }
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("-"),
                  ),
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$giveAwayNumberOfWinners",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: " winners",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ]),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    giveAwayNumberOfWinners += 1;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("+"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Manual Selection",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16)),
                          TextSpan(
                              text: "(optional)",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 13)),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            giveAwayCategory = "Manual Selection";
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width:
                                      giveAwayCategory == "Manual Selection"
                                          ? 2
                                          : 1,
                                  color:
                                      giveAwayCategory == "Manual Selection"
                                          ? Colors.blue
                                          : Colors.grey)),
                          child: Center(
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      giveAwayCategory == "Manual Selection"
                                          ? Colors.blue
                                          : Colors.transparent),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: giveAwayCategory == "Manual Selection" ? 10 : 0,
                  ),
                  SizedBox(
                    height: giveAwayCategory == "Manual Selection" ? 70 : 0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: rImg.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return TitledCircleImage(
                            imageHeight: 50,
                            imageWidth: 50,
                            image: rImg[index],
                            imageTitle: rName[index],
                            onTap: () {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            child: CustomDefaultButton(title: "Share", onTap: (){}),
          )
        ],
      ),
    );
  }
}
