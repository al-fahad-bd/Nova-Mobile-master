import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/bottom_navigation_component.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/dot_Indicator.dart';
import 'package:nova_mobile/features/auth_screens/login_screen/login_screen.dart';
import 'package:nova_mobile/features/intro/components/intro_display_style.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List introItems = [
    const IntroDisplayStyle(imgUrl: "f0d47af5192a592dcf1bdf54fb8fade8.jpg", title: "Community", subMeesage: "Meet up with family and friends like you never left"),
    const IntroDisplayStyle(imgUrl: "8925d18fdf86b1882e29c95795e22c8b.jpg", title: "Nova Nation", subMeesage: "Become part of our community to get all the tools and features we offer, all this just buy signing up with just few clicks"),
    const IntroDisplayStyle(imgUrl: "intro_img3.jpg", title: "Market Place", subMeesage: "Let's help you push your business online with just few clicks \"buying and selling just got a lot better\""),
    const IntroDisplayStyle(imgUrl: "intro_img4.jpg", title: "Finance", subMeesage: "Don't know what next to do, don't worry we've got your covered, get the best financial and social planning and guidance from our expertise around the globe"),
  ];
  int currentIntro = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void onIntroSelected(int index) {
    setState(() {
      currentIntro = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationComponent()));
          }, child: const Text("Skip", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Column(
          children: [
            //intro img
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: 4,
                  onPageChanged: onIntroSelected,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return introItems[index];
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: currentIntro != 3 ? MainAxisAlignment.start: MainAxisAlignment.center,
                  children: [
                    if (currentIntro != 3)
                      for (int i = 0; i < 4; i++)
                        if (currentIntro == i)
                          const BannerIndicator(isActive: true, indicatorColor: Colors.blue,)
                        else
                          const BannerIndicator(isActive: false, indicatorColor: Colors.blue,)
                    else
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: const Center(
                              child: Text(
                                "Let's Go!",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
