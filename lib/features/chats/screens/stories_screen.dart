import 'package:flutter/material.dart';
import 'package:nova_mobile/features/chats/components/story_display_style.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  int _currentStory = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void onStoryChanged(int index) {
    setState(() {
      _currentStory = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: onStoryChanged,
        itemBuilder: (BuildContext context, int index) {
          return StoryDisplayStyle();
        },
      ),
    );
  }
}
