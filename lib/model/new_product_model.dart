import 'dart:convert';
import 'dart:io';

class NewProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final String storeId;
  final String vendorId;
  final List<String> colors;
  final File image;
  final String categoryName;

  NewProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.storeId,
    required this.vendorId,
    required this.colors,
    required this.image,
    required this.categoryName,
  });


  factory NewProductModel.fromMap(Map<String, dynamic> map) {
    return NewProductModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      categoryId: map['category'] ?? '',
      storeId: map['store'] ?? '',
      vendorId: map['vendor'] ?? '',
      colors: map['colors'] ?? '',
      image: map['image'] ?? '',
      categoryName: map['categoryName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'storeId': storeId,
      'vendorId': vendorId,
      'colors': colors,
      'image': image,
      'categoryName': categoryName,
    };
  }

  String toJson() => json.encode(toMap());

  factory NewProductModel.fromJson(String source) =>
      NewProductModel.fromMap(json.decode(source));
}
