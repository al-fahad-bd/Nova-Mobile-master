import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/chats/components/instant_comment_space.dart';

class StoryDisplayStyle extends StatefulWidget {
  const StoryDisplayStyle({super.key});

  @override
  State<StoryDisplayStyle> createState() => _StoryDisplayStyleState();
}

class _StoryDisplayStyleState extends State<StoryDisplayStyle> {
  bool isLoved = false;
  final instantReplyController = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Expanded(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Image.asset(
                "images/item_7.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black12.withOpacity(0.1)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  shape: BoxShape.circle),
                              child: Container(
                                height: 40,
                                width: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "name of user",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "@username",
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            //date and time posted
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "12:30AM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            //like stories
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLoved = !isLoved;
                                  });
                                },
                                icon: isLoved
                                    ? SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Image.asset(
                                            "images/heart_filled.png",
                                            color: Colors.red,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Image.asset(
                                            "images/heart_outlined.png",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                              ),
                            ),

                            //comment on stories
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  IconlyBroken.message,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            //share stories
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "images/feather_copy.png",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                        "images/feather_eye.png",
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      "193",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      //caption
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text:
                                  "everyday knowing that the future belongs to those whose risk everything, is very scary",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12))
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //action
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InstantCommentSpace(
                            obscureText: false,
                            controller: instantReplyController,
                            hintText: "instant reply",
                            onChange: (value) {
                              setState(() {
                                isTextFieldEmpty = value.isEmpty;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  IconlyBroken.send,
                                  color: isTextFieldEmpty
                                      ? Colors.white
                                      : Colors.blue,
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: const Center(
                                    child: Icon(
                                  IconlyBroken.folder,
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
