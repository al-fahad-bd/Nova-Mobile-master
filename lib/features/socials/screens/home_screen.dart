import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/chats/screens/stories_screen.dart';
import 'package:nova_mobile/features/shop/screens/shop_search_screen.dart';
import 'package:nova_mobile/features/socials/components/home_screen_story_circle_display_style.dart';
import 'package:nova_mobile/features/socials/components/image_post_style.dart';
import 'package:nova_mobile/features/socials/screens/socila_notification_screen.dart';
import 'package:nova_mobile/services/auth_services.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthServices authServices = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // authServices.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "images/banner_img.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Text(
                  "user name",
                  style: TextStyle(fontSize: 14),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopSearchScreen()));
              },
              icon: const Icon(IconlyLight.search)),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return const ImagePostStyle();
          },
        ),
      ),
    );
  }
}
