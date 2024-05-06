import 'package:flutter/material.dart';
import 'package:nova_mobile/features/chats/components/social_cutom_button.dart';

class SuggestionDisplayStyle extends StatelessWidget {
  const SuggestionDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 75,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "images/banner_img.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "name of user",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Software Engineer",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialCustomButton(
                        btnTitle: "Request",
                        onPress: () {},
                        bgColor: Colors.blue,
                        textColor: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialCustomButton(
                        btnTitle: "Cancel",
                        onPress: () {},
                        bgColor: Colors.grey,
                        textColor: Colors.white),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
