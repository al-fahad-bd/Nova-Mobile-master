import 'package:flutter/material.dart';
import 'package:nova_mobile/model/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel(
    id: '',
    firstName: '',
    lastName: '',
    otherName: '',
    userName: '',
    gender: '',
    age: '',
    phoneNumber: '',
    email: '',
    password: '',
    profilePicture: '',
    isStoreOwner: false,
    token: '',
    bankName: '',
    accountName: '',
    accountNumber: '',
    bankCode: '',
  );
  UserModel get userModel => _userModel;
  void setUser(String user) {
      _userModel = UserModel.fromJson(user);
      notifyListeners();
  }

  void setUserFromModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
