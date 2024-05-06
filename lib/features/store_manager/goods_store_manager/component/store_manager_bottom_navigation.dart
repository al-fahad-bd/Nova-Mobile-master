import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/store_products_screen.dart';
import '../screen/all_order_screen.dart';
import '../screen/store_manager_dashboard.dart';
import '../screen/store_manager_review_screen.dart';
import '../screen/store_profile_screen.dart';

class StoreManagerBottomNavigation extends StatefulWidget {
  const StoreManagerBottomNavigation({super.key});

  @override
  State<StoreManagerBottomNavigation> createState() => _StoreManagerBottomNavigationState();
}

class _StoreManagerBottomNavigationState extends State<StoreManagerBottomNavigation> {
  List storeManagerBottomNavScreens = [
    const StoreManagerDashBoard(),
    const StoreProductsScreen(),
    const AllOrderScreen(),
    const StoreManagerReviewScreen(),
    const StoreProfileScreen()
  ];
  int currentScreen = 0;
  void onScreenSelected(int index) {
    setState(() {
      currentScreen = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: storeManagerBottomNavScreens[currentScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreen,
        onTap: onScreenSelected,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: currentScreen == 0 ? Image.asset(
                "images/category_filled.png",
                color: Colors.blue[800],
              ) : Image.asset(
                "images/category_outlined.png",
              ),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 25,
                width: 25,
                child: currentScreen == 1 ? Image.asset(
                  "images/shopping-bag-filled.png",
                  color: Colors.blue[800],
                ) : Image.asset(
                  "images/shopping-bag-outlined.png",
                  color: Colors.black26,
                ),
              ),
              label: "Products"),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: currentScreen == 2 ? Image.asset(
                "images/feather_move.png",
                color: Colors.blue[800],
              ) : Image.asset(
                "images/feather_move.png",
              ),
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
              width: 25,
              child: currentScreen == 3 ? Image.asset("images/chat_filled.png", color: Colors.blue[800],) : Image.asset("images/chat_outlined.png"),
            ),
            label: "Reviews",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 35,
              width: 35,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  border: Border.all(color: currentScreen == 4 ? Colors.blue : Colors.transparent)
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
