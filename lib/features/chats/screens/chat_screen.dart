import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/chats/components/instant_comment_space.dart';
import 'package:nova_mobile/features/chats/components/message_space.dart';
import 'package:nova_mobile/features/chats/components/receiver_message_style.dart';
import 'package:nova_mobile/features/chats/components/send_button.dart';
import 'package:nova_mobile/features/chats/components/sender_image_style.dart';
import 'package:nova_mobile/features/chats/components/senders_message_style.dart';
import 'package:nova_mobile/features/shop/components/shop_buttons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final sendMessageController = TextEditingController();
  bool isTextFieldEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(
                Icons.arrow_back,
            ),
        ),
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: Image.asset("images/item_1.jpg", fit: BoxFit.cover,),
            ),
            const SizedBox(width: 5,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("user name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                Text("Active", style: TextStyle(color: Colors.grey, fontSize: 11),),
              ],
            )
          ],
        ),
        actions: const [
          Icon(IconlyBroken.call),
          SizedBox(width: 15,),
          Icon(IconlyBroken.send),
          SizedBox(width: 15,),
          Icon(IconlyBroken.setting),
          SizedBox(width: 15,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                Text(
                  "Yesterday 12:30AM",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11
                  ),
                  textAlign: TextAlign.center,
                ),
                SendersMessageStyle(senderMessage: "Hello how are you doing today, hope you are good",),
                ReceiverMessageStyle(receiverMessage: "Very nice to know, can you please send me an image",),
                SenderImageStyle(),
                ReceiverMessageStyle(receiverMessage: "Nice image",),
                SendersMessageStyle(senderMessage: "I got it from pinterest, a very nice place to get 3D images",),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(150)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle),
                    child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                ],
              ),
              MessageSpace(
                controller: sendMessageController,
                iconButton: null, onChange: (value) {
                setState(() {
                  isTextFieldEmpty = value.isEmpty;
                });
              },),
              const SizedBox(
                width: 1,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: isTextFieldEmpty ? Colors.grey[200] : Colors.blue,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                          isTextFieldEmpty ? IconlyBroken.voice_2 : IconlyBroken.send,
                          color: isTextFieldEmpty
                              ? Colors.grey
                              : Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
