import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/bottom_navigation_component.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_welcome_screen.dart';
import 'package:nova_mobile/features/auth_screens/reset_password_screens/forgot_password_screen.dart';
import 'package:nova_mobile/model/user.dart';
import 'package:nova_mobile/utilities/custom_loader_overlay.dart';

import '../../../main.dart';
import '../../../services/auth_services.dart';
import '../registration_success_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isClicked = false;
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> userLogin(BuildContext context) async {
    final authServices = AuthService();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });

    try {
      await authServices.userLogin(context, email, password);
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
        _isLoading = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FadeInDown(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 800),
                      child: const Text(
                        "ꫜ꩐ꪚꪖ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 900),
                    child: TextSpace(
                      obscureText: false,
                      controller: emailController,
                      hintText: "Enter email",
                      prefixIcon: const Icon(
                        IconlyBold.message,
                        color: Colors.grey,
                      ),
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 900),
                    child: TextSpace(
                      obscureText: isClicked ? false : true,
                      controller: passwordController,
                      hintText: "Enter password",
                      prefixIcon: const Icon(
                        IconlyBold.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        icon: Image.asset(
                          isClicked
                              ? "images/feather_eye.png"
                              : "images/feather_eye_off.png",
                          scale: 4,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPasswordScreen()));
                      },
                      child: FadeInRight(
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 800),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 1000),
                    child: CustomDefaultButton(
                        title: "Login",
                        onTap: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            userLogin(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("All fields are required")));
                          }
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationComponent()));
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 1000),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const RegistrationWelcomeScreen()));
                      },
                      child: const Text(
                        "Don't have an account? SignUp",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (_isLoading) const CustomLoaderOverlay(),
        ],
      ),
    );
  }
}
