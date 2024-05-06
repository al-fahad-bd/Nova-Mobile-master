  import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nova_mobile/utilities/show_snack_bar.dart';

void httpErrorHandler({required http.Response response, required BuildContext context, required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      onSuccess();
      break;
    case 400:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      break;
    case 401:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      break;
    case 404:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      break;
    default:
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      break;

  }
}