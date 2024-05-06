import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/age_screen.dart';

class GenderScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  const GenderScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
  });

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gender"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: gender == "Female"
                          ? Colors.pink
                          : Colors.transparent),
                  child: Center(
                    child: gender == "Female"
                        ? Image.asset(
                            "images/STK-20240102-WA0031.webp",
                            scale: 5.5,
                          )
                        : null,
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: gender == "Male"
                          ? Colors.deepPurple
                          : Colors.transparent),
                  child: Center(
                    child: gender == "Male"
                        ? Image.asset(
                            "images/STK-20240102-WA0439.webp",
                            scale: 5,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Select your gender",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Male"),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Male";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor:
                            gender == "Male" ? Colors.blue : Colors.grey[200],
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.male,
                        color: gender == "Male" ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Female"),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Female";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor:
                            gender == "Female" ? Colors.blue : Colors.grey[200],
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.female,
                        color: gender == "Female" ? Colors.white : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomDefaultButton(title: "Next", onTap: () {
              if (gender != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgeScreen(firstNameValue: widget.firstNameValue, lastNameValue: widget.lastNameValue, otherNameValue: widget.otherNameValue, gender: gender)));
              } else {}
            }),
          ],
        ),
      ),
    );
  }
}
