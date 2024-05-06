import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/settings/screens/settings_screen.dart';
import 'package:nova_mobile/features/socials/screens/user_profile_screen.dart';
import 'package:nova_mobile/services/auth_services.dart';
// import 'package:nova_mobile/provider/user_provider.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/titled_circle_image.dart';
import 'package:provider/provider.dart';

import '../../../services/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isVerified = false;

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
  List imageList = [
    "sample_food36.jpg",
    "sample_food37.jpg",
    "sample_food38.jpg",
    "sample_food39.jpg",
    "sample_food40.jpg",
    "sample_food41.jpg",
    "sample_food.jpg",
    "sample_food2.jpg",
    "sample_food35.jpg",
    "sample_food34.jpg",
    "sample_food33.jpg",
    "sample_food32.jpg",
    "sample_food31.jpg",
    "sample_food20.jpg",
    "sample_food29.jpg",
    "sample_food28.jpg",
    "sample_food3.jpg",
    "sample_food4.jpg",
    "sample_food5.jpg",
    "sample_food6.jpg",
    "sample_food18.jpg",
    "sample_food20.jpg",
    "sample_food21.jpg",
    "sample_food22.jpg",
    "sample_food23.jpg",
    "sample_food24.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
    // Decode base64 profile picture to display
    ImageProvider<Object>? profilePicture;
    if (user.profilePicture != null) {
      // Explicitly cast to String
      final String profilePictureString = user.profilePicture;
      // Check if the profilePictureString is not null before decoding
      if (profilePictureString != null) {
        final Uint8List profilePictureBytes = base64Decode(profilePictureString);
        profilePicture = MemoryImage(profilePictureBytes);
      }
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("@${user.userName}"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            }, child: const Text("Settings", style: TextStyle(color: Colors.blue),))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.memory(
                        base64Decode(user.profilePicture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "@", style: TextStyle(color: Colors.grey[600])),
                            TextSpan(
                                text: user.userName,
                                style: const TextStyle(color: Colors.grey)),
                          ]),
                        ),
                        Text(
                          "${user.firstName} ${user.lastName} ${user.otherName}",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "chief MCDonald's chef",
                                style: TextStyle(color: Colors.grey[600])),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("images/3d-casual-life-young-boys-and-young-girl-jumping.png")),
                      const Text(
                        "Connections",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: Colors.grey),
                      ),
                      const Text(
                        "0",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40, width: 40,child: Image.asset("images/casual-life-3d-using-smartphone-to-shop-for-gifts.png",)),
                      const Text(
                        "Giveaway",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      const Text(
                        "0",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("images/3d-casual-life-money-and-phone-1.png")),
                      const Text(
                        "Coins",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      const Text(
                        "0",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[200],),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Connections",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: rImg.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TitledCircleImage(
                      imageHeight: 50,
                      imageWidth: 50,
                      image: rImg[index],
                      imageTitle: rName[index],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserProfileScreen(
                              userProfilePicture: rImg[index],
                              userNameOfUser: rName[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Uploads",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            const SizedBox(height: 6,),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("images/${imageList[Random().nextInt(imageList.length)]}", fit: BoxFit.cover,),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
