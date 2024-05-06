import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/socials/screens/post_view_screen.dart';
import 'package:nova_mobile/shared_components/circle_image.dart';
import 'package:nova_mobile/shared_components/read_more_long_text.dart';

class ImagePostStyle extends StatefulWidget {
  const ImagePostStyle({super.key});

  @override
  State<ImagePostStyle> createState() => _ImagePostStyleState();
}

class _ImagePostStyleState extends State<ImagePostStyle> {
  String demoMessage =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis massa in nulla condimentum, nec mattis massa tristique. Aenean sit amet rhoncus lorem, id maximus eros. Aenean varius purus a blandit blandit. Phasellus cursus elit nisi, at pulvinar enim viverra eu. Vivamus gravida, mi ac pellentesque vulputate, neque nulla tempor diam, in eleifend diam turpis ac elit. Integer et libero lectus. Proin metus neque, viverra ac congue in, viverra quis lacus. Sed malesuada quis elit fermentum maximus. In a turpis vel libero suscipit consectetur eu et massa. Nullam cursus interdum ultricies. Sed dignissim eros eget sapien mollis euismod sed a ligula. Phasellus tempor nunc sapien, non venenatis nulla aliquam quis. Donec pretium consequat consequat. Morbi ac aliquet quam, non sodales enim. Aliquam pulvinar ut leo eu aliquam. Phasellus ultricies condimentum porttitor. Sed lacinia tortor metus, nec interdum metus tristique suscipit. Ut vitae mi sed quam porta facilisis. Vivamus viverra libero et enim tincidunt, ac pulvinar mauris tincidunt. Nullam et risus eu felis consectetur ullamcorper non nec risus. Fusce aliquam, augue eget eleifend rutrum, nunc diam dictum dolor, vitae fermentum risus nisl ac ex. Sed urna ipsum, tempor et lectus id, finibus vestibulum mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla in risus sodales, tincidunt mauris eget, scelerisque diam.";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        height: 560,
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  //user dp
                  CircleImage(
                      imageHeight: 45,
                      imageWidth: 45,
                      image: "banner_img2.jpg"),
                  //user name and time posted
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "usernmae",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "12 May 2023",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            // const SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostViewScreen()));
              },
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  "images/sample_rest3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Expanded(
                child: ReadMoreText(
                  longText: demoMessage,
                  maxLength: 50,
                ),
              ),
            ),
            const Spacer(),
            //user info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text("899"),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(IconlyLight.message)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("34k"),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(IconlyLight.heart)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
