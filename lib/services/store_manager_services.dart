import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nova_mobile/model/category_model.dart';
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/model/store_model.dart';
import 'package:nova_mobile/model/user.dart';
import 'package:nova_mobile/services/http_error_handler.dart';
import 'package:nova_mobile/services/store_provider.dart';
import 'package:nova_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/store_manager/goods_store_manager/component/store_manager_bottom_navigation.dart';
import '../model/order_model.dart';
import '../model/sales_model.dart';

class StoreManagerService with ChangeNotifier {
  List<Store> _stores = [];
  static const String baseUrl = "https://red-smoggy-bull.cyclic.app";
  static const String url2 = "http://192.168.137.1:3001";

  List<Store> get stores => [..._stores];

  Future<void> registerStore(
      BuildContext context, String storeName, String storeDescription) async {
    const url = '$baseUrl/api/v1/stores/new-store';
    Store store = Store(
      id: '',
      storeName: storeName,
      storeDescription: storeDescription,
      owner: '',
      storeAdmin: '',
      totalProduct: '',
    );
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('Authorization');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(store),
      );
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StoreManagerBottomNavigation()));
          });
    } catch (error) {
      throw (error);
    }

    Future<void> fetchStores() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Authorization");
      try {
        final response = await http.get(
          Uri.parse("$url2/api/v1/stores/my-store"),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        if (responseData['stores'] != null) {
          final List<Store> loadedStores = [];
          responseData['stores'].forEach((storeData) {
            loadedStores.add(Store.fromJson(storeData));
          });
          _stores = loadedStores;
          notifyListeners();
        }
      } catch (error) {
        throw (error);
      }
    }
  }

  Future<List<Product>> fetchMyStoreProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    List<Product> productList = [];
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/v1/stores/my-store"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            jsonDecode(response.body)['products'];
        for (var productData in responseData) {
          productList.add(Product.fromMap(productData));
        }
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (err) {
      print(err);
    }
    return productList;
  }

  Future<Store> fetchStoreInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");

    // Check if token is null
    if (token == null) {
      throw Exception('Token is null');
    }

    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/v1/stores/my-store"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['myStore'][0];
        return Store.fromJson(jsonData);
      } else {
        throw Exception('Failed to load store info');
      }
    } catch (err) {
      print(err);
      throw Exception('Failed to fetch store info');
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/category/all-category"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch categories!');
    }
  }

  //creating new product
  Future<String> uploadProduct(Map<String, dynamic> product,
      {File? image}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Authorization");
      final Uri url = Uri.parse("$baseUrl/api/v1/products/new-product");
      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      product.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add image file to the request if available
      if (image != null) {
        // Read image bytes and encode as Base64
        List<int> imageBytes = await image.readAsBytes();
        String base64Image = base64Encode(imageBytes);

        // Add base64 image string as a field in the request
        request.fields['image'] = base64Image;
      }

      // Add Authorization header
      request.headers['Authorization'] = 'Bearer $token';
      // Set Content-Type header (no need to set it explicitly, it's handled by http package)

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Product uploaded successfully.';
      } else {
        var responseData = await response.stream.bytesToString();
        return 'Failed to upload product. $responseData';
      }
    } catch (error) {
      throw (error);
    }
  }

  //update product
  Future<String> updateProduct(Map<String, dynamic> productData,
      {File? image}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Authorization");
      var url = Uri.parse('$baseUrl/api/v1/products/update-product');
      var request = http.MultipartRequest('PUT', url);

      // Add fields to the request
      productData.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add image file to the request if available
      if (image != null) {
        // Read image bytes and encode as Base64
        List<int> imageBytes = await image.readAsBytes();
        String base64Image = base64Encode(imageBytes);

        // Add base64 image string as a field in the request
        request.fields['image'] = base64Image;
      }

      // Add Authorization header
      request.headers['Authorization'] = 'Bearer $token';

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Product updated successfully.';
      } else {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);
        var errorMessage = jsonResponse['message'] ?? 'Unknown error occurred.';
        return 'Failed to update product. $errorMessage';
      }
    } catch (e) {
      return 'Failed to connect to the server: $e';
    }
  }

  //delete product
  Future<void> deleteProduct({
    required BuildContext context,
    required Product product,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    try {
      http.Response res = await http.delete(
        Uri.parse('$baseUrl/api/v1/products/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode({
          'id': product.id, // Passing the product ID in the request body
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product deleted successfully.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete product.'),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to connect to the server.'),
        ),
      );
    }
  }


  Future<void> newCategory(BuildContext context, String categoryName) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Authorization");
      final Uri url = Uri.parse("$baseUrl/api/v1/category/new-category");

      // Prepare the request body
      Map<String, dynamic> requestBody = {"name": categoryName};

      // Make the HTTP request
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Category created successfully")),
        );
      } else {
        // Handle non-2xx status codes
        print("Failed to create category: HTTP ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to create category")),
        );
      }
    } catch (error) {
      print("Error creating category: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to create category")),
      );
    }
  }

  void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<Order>> fetchAllOrders(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$baseUrl/admin/get-orders'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      });

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e);
    }
    return orderList;
  }

  Future<Map<String, dynamic>> getEarnings(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Authorization");
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response res =
          await http.get(Uri.parse('$baseUrl/admin/analytics'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      });

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalEarnings'];
          sales = [
            // Sales('Mobiles', response['mobileEarnings']),
            // Sales('Essentials', response['essentialEarnings']),
            // Sales('Books', response['booksEarnings']),
            // Sales('Appliances', response['applianceEarnings']),
            // Sales('Fashion', response['fashionEarnings']),
          ];
        },
      );
    } catch (e) {
      print(e);
    }
    return {
      'sales': sales,
      'totalEarnings': totalEarning,
    };
  }
}
