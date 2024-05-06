import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_mobile/components/bottom_navigation_component.dart';
import 'package:nova_mobile/features/auth_screens/login_screen/login_screen.dart';
import 'package:nova_mobile/features/intro/screen/intro_screen.dart';
import 'package:nova_mobile/features/socials/screens/home_screen.dart';
import 'package:nova_mobile/services/auth_services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  // final AuthServices authServices = AuthServices();
  @override
  void initState() {
    super.initState();
    // authServices.getUserData(context);
    Future.delayed(const Duration(seconds: 4), (){
      final navigator = Navigator.of(context);
      navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const IntroScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          SizedBox(
            height: 180,
            width: 180,
            child: FadeInDown(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 800),
              // child: Image.asset("images/nova-logo.png"),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "ꫜ꩐ꪚꪖ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40
                          ),
                        ),
                        TextSpan(
                          text: "Mobile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "from ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    )
                  ),
                  TextSpan(
                      text: "ꫜ꩐ꪚꪖ Technology",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    )
                  ),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}