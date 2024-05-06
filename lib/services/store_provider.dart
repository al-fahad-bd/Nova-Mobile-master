import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nova_mobile/model/store_model.dart';

class StoreProvider with ChangeNotifier {
  Store _store = Store(
    id: '',
    storeName: '',
    storeDescription: '',
    owner: '',
    storeAdmin: '',
    totalProduct: '',
  );

  Store get store => _store;

  // void setStore(String responseBody) {
  //   // final parsed = json.decode(responseBody);
  //   _store = Store.fromJson(responseBody);
  //   notifyListeners();
  // }

  void setStoreFromModel(Store store) {
    _store = store;
    notifyListeners();
  }
}