import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/chats/screens/messages_screen.dart';
import 'package:nova_mobile/features/shop/comon_screen/shop_screen.dart';
import 'package:nova_mobile/features/socials/screens/home_screen.dart';
import 'package:nova_mobile/features/wallet_screens/screens/wallet_screen.dart';
import 'package:nova_mobile/features/notification/screen/notification_screen.dart';
import 'package:nova_mobile/features/socials/screens/profile_screen.dart';

class BottomNavigationComponent extends StatefulWidget {
  const BottomNavigationComponent({super.key});

  @override
  State<BottomNavigationComponent> createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
  List<Widget> bottomNavScreen = [
    const WalletScreen(),
    const ShopScreen(),
    const MessagesScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];
  int _currentScreen = 0;

  void onScreenSelected(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bottomNavScreen[_currentScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentScreen,
        onTap: onScreenSelected,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: _currentScreen == 0 ? Image.asset(
                "images/home (1).png",
                color: Colors.blue[800],
              ) : Image.asset(
                "images/home.png",
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                width: 25,
                child: _currentScreen == 1 ? Image.asset(
                  "images/shopping-cart (1).png",
                  color: Colors.blue[800],
                ) : Image.asset(
                  "images/shopping-cart.png",
                  color: Colors.black26,
                ),
              ),
              label: "Shop"),

          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: _currentScreen == 2 ? Icon(IconlyBold.message) : Icon(IconlyLight.message),
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: _currentScreen == 3 ? Image.asset(
                "images/wallet (2).png",
                color: Colors.blue[800],
              ) : Image.asset(
    "images/wallet (1).png",
    ),
            ),
            label: "Currents",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 35,
              width: 35,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: _currentScreen == 4 ? Colors.blue : Colors.transparent)
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
