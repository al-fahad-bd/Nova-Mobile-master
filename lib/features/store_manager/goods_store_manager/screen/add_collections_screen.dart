import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/product_upload_success_screen.dart';
import 'package:nova_mobile/model/category_model.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';
import 'package:nova_mobile/utilities/custom_loader_overlay.dart';

class AddCollectionsScreen extends StatefulWidget {
  const AddCollectionsScreen({super.key});

  @override
  State<AddCollectionsScreen> createState() => _AddCollectionsScreenState();
}

class _AddCollectionsScreenState extends State<AddCollectionsScreen> {
  final collectionNameController = TextEditingController();
  final collectionDescriptionController = TextEditingController();
  final collectionPriceController = TextEditingController();
  final newCategoryController = TextEditingController();
  final collectionSizeController = TextEditingController();
  final collectionQuantityController = TextEditingController();
  final searchCategoryController = TextEditingController();

  List<CategoryModel> categories = [];
  String? selectedCategory;
  StoreManagerService storeManagerService = StoreManagerService();
  int initialQuantity = 0;
  PlatformFile? pickedFile;
  int productAmount = 0;
  File? _collectionImageFile;
  String _formattedNumber = '';
  String? _base64Image;
  bool _isLoading = false;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _collectionImageFile = File(image.path);
        });
        if (_collectionImageFile != null && await _collectionImageFile!.exists()) {
          // Read image bytes and encode as Base64
          List<int> imageBytes = await _collectionImageFile!.readAsBytes();
          _base64Image = base64Encode(imageBytes);
        } else {
          print('Image file does not exist.');
          _base64Image = null;
        }
      }
    } catch (e) {
      print('Error picking image: $e');
      _base64Image = null;
    }
  }

  Future<void> _uploadNewCollection() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Map<String, dynamic> product = {
        'name': collectionNameController.text.trim(),
        'description': collectionDescriptionController.text.trim(),
        'price': double.parse(collectionPriceController.text.trim()),
        'category': selectedCategory ?? "",
        'store': "",
        'vendor': "",
        'categoryName': selectedCategory ?? "",
        'quantityOfProduct': int.parse(collectionQuantityController.text.trim()),
        // Add any other fields you want to update
      };
      String result =
      await storeManagerService.uploadProduct(product, image: _collectionImageFile);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProductUploadSuccessScreen()));
    } catch (err) {
      setState(() {
        _isLoading =
        false; // Set isLoading to false when error handling is complete
      });
    }
  }

  late Future<List<CategoryModel>> futureCategories =
  storeManagerService.fetchCategories();

  void _selectCategory(CategoryModel category) {
    setState(() {
      selectedCategory = category.name;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Add Collections"),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Publish",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                children: [
                  //collection images
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 450,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: _collectionImageFile == null
                          ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No image selected.',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '(Tap to select image)',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ))
                          : Image.file(
                        _collectionImageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //collection name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Collection Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpace(
                          obscureText: false,
                          controller: collectionNameController,
                          hintText: "collection name",
                          prefixIcon: null,
                          suffixIcon: null),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //collection description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Collection Description",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpace(
                          obscureText: false,
                          controller: collectionDescriptionController,
                          hintText: "collection description",
                          prefixIcon: null,
                          suffixIcon: null),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //collection price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Collection Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2), width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 38,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 13,
                                        width: 13,
                                        child: Center(
                                          child: Image.asset(
                                              "images/nigeria-naira-currency-symbol.png"),
                                        ),
                                      ),
                                      Text(
                                        _formattedNumber == ''
                                            ? '0'
                                            : _formattedNumber,
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextSpace(
                                obscureText: false,
                                controller: collectionPriceController,
                                keyboardType: TextInputType.number,
                                hintText: "collection price",
                                prefixIcon: null,
                                suffixIcon: null,
                                onChange: (value) {
                                  setState(() {
                                    if (value.isEmpty) {
                                      _formattedNumber = '';
                                    } else {
                                      int number = int.parse(value);
                                      _formattedNumber = _formatNumber(number);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        selectedCategory ??
                            'Click on the floating action button to select a category',
                        style: TextStyle(
                          fontSize: selectedCategory == null ? 11 : 18,
                          fontWeight: FontWeight.w400,
                          color: selectedCategory == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  //quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Collection Quantity",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpace(
                          obscureText: false,
                          controller: collectionQuantityController,
                          hintText: "how many do you have available",
                          prefixIcon: null,
                          suffixIcon: null),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //size
                  //product size
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Collection Size",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpace(
                          obscureText: false,
                          controller: collectionSizeController,
                          hintText: "XL, L, XXL, 45, 3.5 etc",
                          prefixIcon: null,
                          suffixIcon: null),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: SearchSpace(
                                  controller: searchCategoryController,
                                  prefixIcon: const Icon(IconlyLight.search),
                                  hintText: "Search")),
                          Expanded(
                            child: FutureBuilder<List<CategoryModel>>(
                              future: futureCategories,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CustomLoader(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else {
                                  List<CategoryModel> categories =
                                  snapshot.data!;
                                  return ListView.builder(
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            _selectCategory(categories[index]),
                                        child: Container(
                                          height: 55,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  categories[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                ),
                                                Text(
                                                  categories[index].description,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading) const CustomLoaderOverlay(),
        ],
      ),
    );
  }
  String _formatNumber(int number) {
    NumberFormat formatter = NumberFormat("#,###");
    return formatter.format(number);
  }
}
