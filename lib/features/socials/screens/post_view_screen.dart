import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/chats/screens/stories_screen.dart';
import 'package:nova_mobile/features/socials/components/comments_display_style.dart';
import 'package:nova_mobile/features/socials/components/home_screen_story_circle_display_style.dart';
import 'package:nova_mobile/features/socials/components/image_post_style.dart';

class PostViewScreen extends StatefulWidget {
  const PostViewScreen({super.key});

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  final postCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("username"),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "share",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //like
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(IconlyLight.heart)),
                      const Text("34k"),
                    ],
                  ),
                  //comment
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(IconlyLight.message)),
                      const Text("899"),
                    ],
                  ),
                  //like
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(IconlyLight.download)),
                      const Text("50"),
                    ],
                  ),
                ],
              ),
              //bookmark
              IconButton(onPressed: (){}, icon: const Icon(IconlyLight.bookmark)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return const CommentsDisplayStyle();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Image.asset("images/banner_img.jpg", fit: BoxFit.cover,),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextSpace(obscureText: false, controller: postCommentController, hintText: "wrote a comment...", prefixIcon: null, suffixIcon: null),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
