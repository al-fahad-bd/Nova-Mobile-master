import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nova_mobile/features/auth_screens/login_screen/login_screen.dart';
import 'package:nova_mobile/features/auth_screens/registration_failed_screen.dart';
import 'package:nova_mobile/features/settings/screens/store_manager_screen.dart';
import 'package:nova_mobile/services/http_error_handler.dart';
import 'package:nova_mobile/services/store_provider.dart';
import 'package:nova_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottom_navigation_component.dart';
import '../features/auth_screens/registration_success_screen.dart';
import '../model/user.dart';
import '../utilities/show_snack_bar.dart';

class AuthService with ChangeNotifier {
  static const String url2 = "http://192.168.137.1:3001";
  static const String baseUrl = "https://red-smoggy-bull.cyclic.app";

  Future<void> registerUser(
      BuildContext context,
      String firstName,
      String lastName,
      String otherName,
      String userName,
      String gender,
      String age,
      String phoneNumber,
      String email,
      String password) async {
    try {
      UserModel userModel = UserModel(
        id: '',
        firstName: firstName,
        lastName: lastName,
        otherName: otherName,
        userName: userName,
        gender: gender,
        age: age,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        profilePicture: '',
        isStoreOwner: false,
        token: '',
        bankName: '',
        accountName: '',
        accountNumber: '',
        bankCode: '',
      );
      final response =
          await http.post(Uri.parse("$baseUrl/api/v1/users/register"),
              headers: {
                "Content-Type": "application/json",
              },
              body: userModel.toJson()
          );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationSuccessScreen()));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationFailedScreen()));
      }
    } catch (err) {
      throw (err);
    }
  }

  Future<void> userLogin(BuildContext context, String email, String password) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/api/v1/users/login"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));

      //main
      httpErrorHandler(response: response, context: context, onSuccess: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(response.body);
        await prefs.setString('Authorization', jsonDecode(response.body)['token']);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavigationComponent()));
      });

    } catch (err) {
      throw (err);
    }
  }

  void getUserProfile(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('Authorization');

      if (token == null) {
        prefs.setString('Authorization', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$baseUrl/api/v1/users/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$baseUrl/api/v1/users/user-profile'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);

      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> updateProfile(
      Map<String, dynamic> updates,
      {File? image}
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('Authorization');
      var url = Uri.parse('$baseUrl/api/v1/users/update-account');
      var request = http.MultipartRequest('PUT', url);

      // Add fields to the request
      updates.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add image file to the request if available
      if (image != null) {
        // Read image bytes and encode as Base64
        List<int> imageBytes = await image.readAsBytes();
        String base64Image = base64Encode(imageBytes);

        // Add base64 image string as a field in the request
        request.fields['profilePicture'] = base64Image;
      }

      // Add Authorization header
      request.headers['Authorization'] = 'Bearer $token';
      // Set Content-Type header (no need to set it explicitly, it's handled by http package)

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Profile updated successfully.';
      } else {
        var responseData = await response.stream.bytesToString();
        return 'Failed to update profile. $responseData';
      }
    } catch (e) {
      return 'Failed to connect to the server.';
    }
  }


  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('Authorization', '');
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print(e);
    }
  }
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BottomNavigationComponent()));
}
