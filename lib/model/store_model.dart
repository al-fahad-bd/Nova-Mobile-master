class Store {
  final String id;
  final String storeName;
  final String storeDescription;
  final String owner;
  final String storeAdmin;
  final String totalProduct;

  Store({
    required this.id,
    required this.storeName,
    required this.storeDescription,
    required this.owner,
    required this.totalProduct,
    required this.storeAdmin,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['_id'],
      storeName: json['storeName'],
      storeDescription: json['storeDescription'],
      owner: json['owner'],
      storeAdmin: json['storeAdmin'],
      totalProduct: json['totalProduct'],
    );
  }
}