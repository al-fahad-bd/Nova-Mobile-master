import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/chats/components/request_display_style.dart';
import 'package:nova_mobile/features/chats/components/social_cutom_button.dart';
import 'package:nova_mobile/features/chats/screens/add_connections_screen.dart';
import 'package:nova_mobile/features/chats/screens/suggestion_screen.dart';
import 'package:nova_mobile/features/chats/screens/your_friends_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connection Request"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(IconlyLight.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                SocialCustomButton(btnTitle: "Suggestion", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SuggestionScreen()));
                }, bgColor: Colors.blue, textColor: Colors.white),
                const SizedBox(width: 10,),
                SocialCustomButton(btnTitle: "Connections", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const YourFriendsScreen()));
                }, bgColor: Colors.blue, textColor: Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return RequestDisplayStyle();
                },
              )
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddConnectionScreen()));
        }, backgroundColor: Colors.blue, child: const Icon(IconlyBold.add_user, color: Colors.white,),),
    );
  }
}
