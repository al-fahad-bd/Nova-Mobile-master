import 'dart:convert';
import 'dart:io';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String store;
  final String vendor;
  final String image;
  final String categoryName;
  final int quantityOfProduct;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.store,
    required this.vendor,
    required this.image,
    required this.categoryName,
    required this.quantityOfProduct,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      store: map['store'] ?? '',
      vendor: map['vendor'] ?? '',
      image: map['image'] ?? '',
      categoryName: map['categoryName'] ?? '',
      quantityOfProduct: map['quantityOfProduct'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'store': store,
      'vendor': vendor,
      'image': image,
      'categoryName': categoryName,
      'quantityOfProduct': quantityOfProduct,
    };
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
