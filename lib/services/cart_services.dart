// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:nova_mobile/model/product_model.dart';
// import 'package:nova_mobile/model/user.dart';
// import 'package:nova_mobile/services/http_error_handler.dart';
// import 'package:nova_mobile/services/user_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartServices {
//   static const String baseUrl = "https://red-smoggy-bull.cyclic.app";
//
//   void removeFromCart({
//     required BuildContext context,
//     required Product product,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("Authorization");
//
//     try {
//       final res = await http.delete(
//         Uri.parse('$baseUrl/api/remove-from-cart/${product.id}'),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization': "Bearer $token",
//         },
//       );
//
//       httpErrorHandler(
//         response: res,
//         context: context,
//         onSuccess: () {
//           UserModel user = userProvider.userModel
//               .copyWith(cart: jsonDecode(res.body)['cart']);
//           userProvider.setUserFromModel(user);
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
