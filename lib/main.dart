import 'package:flutter/material.dart';
import 'package:nova_mobile/features/chats/screens/request_screen.dart';
import 'package:nova_mobile/features/chats/screens/stories_screen.dart';
import 'package:nova_mobile/features/intro/screen/intro_screen.dart';
import 'package:nova_mobile/features/socials/screens/home_screen.dart';
import 'package:nova_mobile/screens/splash_screen.dart';
import 'package:nova_mobile/services/auth_services.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/services/store_provider.dart';
import 'package:nova_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';

import 'features/store_manager/goods_store_manager/screen/add_product_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StoreProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nova Mobile',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class AuthServices {}