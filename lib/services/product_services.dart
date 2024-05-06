import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/services/http_error_handler.dart';
import 'package:nova_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order_model.dart';

class ProductServices {
  String url2 = "http://192.168.137.1:3001";
  static const String baseUrl =
      'https://red-smoggy-bull.cyclic.app'; // Replace with your actual API base URL

  static Future<String> updateProduct(
      String productId, Map<String, dynamic> productData, String token) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update-product?id=$productId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productData),
      );

      if (response.statusCode == 200) {
        return 'Product updated successfully.';
      } else {
        return 'Failed to update product. ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Failed to connect to the server.';
    }
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('Authorization');
    List<Product> productList = [];
    try {
      final res = await http.get(Uri.parse('$baseUrl/api/v1/products/all-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      });
      if (res.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(res.body)['products']; // Assuming 'products' is the key containing the list of products
        for (var productData in responseData) {
          productList.add(Product.fromMap(productData));
        }
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw e;
    }
    return productList;
  }

}
