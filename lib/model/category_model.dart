class CategoryModel {
  final String name;
  final String description;

  CategoryModel({
    required this.name,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      description: json['description'],
    );
  }
}
