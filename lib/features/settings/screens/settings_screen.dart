import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/settings/components/other_settings_display_style.dart';
import 'package:nova_mobile/features/settings/screens/account_level_screen.dart';
import 'package:nova_mobile/features/settings/screens/billing_screen.dart';
import 'package:nova_mobile/features/settings/screens/edit_profile_screen.dart';
import 'package:nova_mobile/features/settings/screens/password_screen.dart';
import 'package:nova_mobile/features/settings/screens/store_manager_screen.dart';
import 'package:nova_mobile/features/shop/comon_screen/order_screen.dart';
import 'package:nova_mobile/main.dart';
// import 'package:nova_mobile/provider/user_provider.dart';
import 'package:nova_mobile/services/auth_services.dart';
import 'package:provider/provider.dart';
import '../../../model/user.dart';
import '../../../services/user_provider.dart';
import '../../store_manager/goods_store_manager/component/store_manager_bottom_navigation.dart';
import '../../store_manager/shared_screen/store_application_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthServices authService = AuthServices();
  void logOut(BuildContext context) {
    // authService.logOut(context);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;

    // Decode base64 profile picture to display
    ImageProvider<Object>? profilePicture;
    if (user.profilePicture != null) {
      final String? profilePictureString = user.profilePicture as String?;
      if (profilePictureString != null) {
        final Uint8List profilePictureBytes = base64Decode(profilePictureString);
        profilePicture = MemoryImage(profilePictureBytes);
      }
    }


    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () => logOut(context), child: const Text("Logout", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[000]
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        // Display profile picture if available, otherwise display a placeholder image
                        backgroundImage: profilePicture ?? AssetImage('images/default_avatar.png'),
                        backgroundColor: Colors.grey, // Placeholder color
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "${user.firstName} ${user.lastName} ${user.otherName}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ]),
                        ),
                        const SizedBox(height: 5,),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "@${user.userName}",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Profile settings", style: TextStyle(color: Colors.grey[400], fontSize: 12),)
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset("images/feather_chevron_right.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Account Settings",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
            OtherSettingsDisplayStyle(title: "Your Orders", icon: Image.asset("images/feather_clipboard.png"), onClick: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));},),
            OtherSettingsDisplayStyle(title: "Billing Settings", icon: Image.asset("images/wallet.png"), onClick: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const BillingScreen()));},),
            OtherSettingsDisplayStyle(title: "Account Level", icon: Image.asset("images/fingerprint-filled.png"), onClick: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountLevelScreen()));},),
            OtherSettingsDisplayStyle(title: "Store Manager", icon: Image.asset("images/network.png"), onClick: () async {
              UserModel user = Provider.of<UserProvider>(context, listen: false).userModel;
              if (user.isStoreOwner) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreManagerBottomNavigation()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreNameScreen()));
              }
            },),
            OtherSettingsDisplayStyle(title: "Shopping Preference", icon: Image.asset("images/shopping-cart.png"), onClick: (){},),
            OtherSettingsDisplayStyle(title: "Help & Support", icon: Image.asset("images/feather_phone_call.png"), onClick: (){},),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "System Settings",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),
            ),
            OtherSettingsDisplayStyle(title: "Security", icon: Image.asset("images/feather_lock.png"), onClick: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
            },),
            OtherSettingsDisplayStyle(title: "Language", icon: Image.asset("images/profile-connections-outlined.png"), onClick: (){},),
            OtherSettingsDisplayStyle(title: "Visibility", icon: Image.asset("images/feather_eye.png"), onClick: (){},),
            OtherSettingsDisplayStyle(title: "Theme", icon: Image.asset("images/feather_lock.png"), onClick: (){},),
            OtherSettingsDisplayStyle(title: "Location", icon: Image.asset("images/map_marker_outlined.png"), onClick: (){},),
          ],
        ),
      ),
    );
  }
}
