import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String otherName;
  final String userName;
  final String gender;
  final String age;
  final String phoneNumber;
  final String email;
  final String password;
  final String profilePicture;
  final bool isStoreOwner;
  final String token;
  final String bankName;
  final String accountName;
  final String accountNumber;
  final String bankCode;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.otherName,
    required this.userName,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.isStoreOwner,
    required this.token,
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
    required this.bankCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'otherName': otherName,
      'userName': userName,
      'gender': gender,
      'age': age,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'isStoreOwner': isStoreOwner,
      'token': token,
      'bankName': bankName,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      otherName: map['otherName'] ?? '',
      userName: map['userName'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      isStoreOwner: map['isStoreOwner'] ?? '',
      token: map['token'] ?? '',
      bankName: map['bankName'] ?? '',
      accountName: map['accountName'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      bankCode: map['bankCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? otherName,
    String? userName,
    String? gender,
    String? age,
    String? phoneNumber,
    String? email,
    String? password,
    String? profilePicture,
    bool? isStoreOwner,
    String? token,
    String? bankName,
    String? accountName,
    String? accountNumber,
    String? bankCode,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      otherName: otherName ?? this.otherName,
      userName: userName ?? this.userName,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
      isStoreOwner: isStoreOwner ?? this.isStoreOwner,
      token: token ?? this.token,
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankCode: bankCode ?? this.bankCode,
    );
  }
}
