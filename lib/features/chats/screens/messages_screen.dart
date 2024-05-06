import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/features/chats/components/messages_user_display_style.dart';
import 'package:nova_mobile/features/chats/components/story_display_style.dart';
import 'package:nova_mobile/features/chats/screens/post_a_story_screen.dart';
import 'package:nova_mobile/features/chats/screens/request_screen.dart';
import 'package:nova_mobile/features/socials/screens/socila_notification_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List collectionImage = [
    "banner_img.jpg",
    "0d2f2ec31a05794c70a26b024403de32.jpg",
    "0d2569fa15d54f392b77c48adfc46d68.jpg",
    "1d56fd8f283eb1e045da26a9537037bf.jpg",
    "3ff399c96cbe2f2b511e78a4b89a18a8.jpg",
    "03e6048301cf0310e5ce1d466b56cadc.jpg",
    "4aa7dda11b76d7d3ae5059939f90c0ee.jpg",
    "04e548504925a0428546eefdaf2e1a9b.jpg",
    "5afe6382eecfc215fd57db61a3702574.jpg",
    "9e3b173a2a184c90908cc6bfa7d8ee5c.jpg",
    "13a23e8752178bbd35d705025b915536.jpg",
    "15e98995ea6b704d7884acb726352628.jpg",
    "16c655d742ef34b52f1a72223fcd9e08.jpg",
    "50f6e37d70868ad21985a85d947b5a0a.jpg",
    "68ff50ac20e12c73e0d8939b21776749.jpg",
    "82c067cffdd72e5d0326dd37bb24d52e.jpg",
    "0086ab87ae68c0bc24956c8ec39dc92a.jpg",
    "158d8b2740837e25981683b8719a5fce.jpg",
    "381c13c6afe32d6f6a5ce00330e5148a.jpg",
    "392aec1ca20a9f43e482d1971a0620b6.jpg",
    "465dec7678d42a691907ede78c146f7a.jpg",
    "471fb3003a8d1a75c21998a17b1b5eb8.jpg",
    "483df3413d4c3ede89f4b33459586055.jpg",
    "483e2ed2d8b5b175c82dddc6c328a258.jpg",
    "931ec9006cd98de505e8469d30a8dfa1.jpg",
    "944f20b295393c65483106b08a44c7b6.jpg",
    "982e870643de934c77bb35216d48ce77.jpg",
    "2337ca3973d0b8850c590f84c3af8153.jpg",
    "2644ed706b28c552f7637a0bd62b9cba.jpg",
    "5581da6f4a07d52a01113b40fac24081.jpg",
    "7898e2ee752aff4dc619974d1ac8f63f.jpg",
    "040299abd7103354c3c02ce52f5668a2.jpg",
    "288650f9b44ca5117fbf752be47c5b67.jpg",
    "357567ef0ee82f00e409a39ec27ddeb2.jpg",
    "73251673b5bffb8ff501d396725441eb.jpg",
    "211202959a5d2b87ac7951d3233d4bed.jpg",
    "0454218032f91dc89f346f95552f3222.jpg",
    "840882234e104cc71eb3a70f2213e5cc.jpg",
    "4536390552c55a67cf2dd5b9c31a6213.jpg",
    "a15ebdf1304af8c9527d5b49339d9e28.jpg",
    "a015bd039d4c32f8bdce1532b1b0e016.jpg",
    "a98c4c8e3e2826398899c3b79349bec9.jpg",
    "a2334bd13f42e11efb22ea4ec4ab528e.jpg",
    "b2ed3b33e125b9bf65d415c8617bce37.jpg",
    "b44c09f56d4ab35a9369c1d1a65fed86.jpg",
    "b64ea11f8bbbe4725ec8c7d4e2b1c828.jpg",
    "ba6a081b2a989593600fdaad28b5524f.jpg",
    "bc5a1ad76e6f7d385a73beec19e113ee.jpg",
    "bc673beb5735589a7ff6669f744efdfd.jpg",
    "bf1ecd92a7cabe26caba0b94e95a39a0.jpg",
    "c4ac78d0cbe5cc420590fcbc58df9938.jpg",
    "c760f4826473e242ae231562f6957a9c.jpg",
    "cba9ac5d9fca3ea81f835badc26526dc.jpg",
    "cce24929d3c537605ccc5551f08b91e0.jpg",
    "d3e7e3d635aeae5f0e6ccea5b7787fc0.jpg",
    "d15c5dc07c222af53b5dfb066de6a836.jpg",
    "dcc8c213b695b640c3db17369213ef57.jpg",
    "e2b9f2f69d15ca0017e062242124f40a.jpg",
    "e6b62bb9adcffc1c645f1603c05e429c.jpg",
    "e6f0fa4b12e6303ac29448a4891e0db6.jpg",
    "e054f64620059eba26d4cd4047e29d93.jpg",
    "e91ce6b22a8a6652ee80fce45aabb41a.jpg",
    "e962065c51c5b27e7930992e9e150f02.jpg",
    "ec127ab997e4f663b401a022c365a41a.jpg",
    "ed7d8733b9305182684c865df2b13008.jpg",
    "f809360776fecf2d7bf7ffb3ad243a5b.jpg",
    "fab55b36e6195a8d82bdda0e8a28be22.jpg",
    "fd6dac2752e51769b052df23decba4c0.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(IconlyLight.search, color: Colors.grey, size: 15,),
                        SizedBox(width: 10,),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SocialNotificationScreen()));
                    },
                    icon: const Icon(IconlyLight.notification)),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              "images/banner_img.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            //users
            Expanded(
              child: ListView.builder(
                itemCount: collectionImage.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return MessagesUserDisplayStyle(userImage: collectionImage[Random().nextInt(collectionImage.length)],);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RequestScreen()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          IconlyBold.user_2,
          color: Colors.white,
        ),
      ),
    );
  }
}
