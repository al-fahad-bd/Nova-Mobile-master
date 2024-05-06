import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/model/category_model.dart';
import 'package:nova_mobile/model/product_model.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';
import 'package:nova_mobile/utilities/custom_loader_overlay.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;
  final String productID;
  const EditProductScreen({Key? key, required this.product, required this.productID}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final updateProductNameController = TextEditingController();
  final updateProductDescriptionController = TextEditingController();
  final updateProductPriceController = TextEditingController();
  final updateProductSizeController = TextEditingController();
  final updateProductQuantityController = TextEditingController();
  final searchCategoryController = TextEditingController();

  List<CategoryModel> categories = [];
  String? selectedCategory;
  StoreManagerService storeManagerService = StoreManagerService();
  int initialQuantity = 0;
  PlatformFile? pickedFile;
  int productAmount = 0;
  File? _imageFile;
  String _formattedNumber = '';
  String? _base64Image;
  Uint8List? _decodedImage;
  bool _isLoading = false;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
          _decodedImage = null; // Clear the existing decoded image
        });
        if (_imageFile != null && await _imageFile!.exists()) {
          // Read image bytes and encode as Base64
          List<int> imageBytes = await _imageFile!.readAsBytes();
          _base64Image = base64Encode(imageBytes);
          print('Base64 Image: $_base64Image');
          // Decode base64 image and update decoded image
          _decodedImage = base64Decode(_base64Image!);
        } else {
          print('Image file does not exist.');
          _base64Image = null;
          _decodedImage = null;
        }
      }
    } catch (e) {
      print('Error picking image: $e');
      _base64Image = null;
      _decodedImage = null;
    }
  }

  late Future<List<CategoryModel>> futureCategories =
  storeManagerService.fetchCategories();

  Future<void> _updateProduct() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Gather updated product data
      Map<String, dynamic> productData = {
        'name': updateProductNameController.text,
        'description': updateProductDescriptionController.text,
        'price': double.parse(updateProductPriceController.text),
        // Use the initial category value if no category is selected
        'category': selectedCategory ?? widget.product.category,
      };

      print('Product Data: $productData');

      // Call updateProduct service
      String message = await storeManagerService.updateProduct(
        productData,
        image: _imageFile,
      );

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update product. Please try again.'),
        ),
      );
    }
  }


  void _selectCategory(CategoryModel category) {
    setState(() {
      selectedCategory = category.name;
    });
    Navigator.pop(context);
  }

  void _uploadNewCategory() {
    // Handle the process of uploading a new category
    // This could involve opening a dialog or a new screen to enter details of the new category
    // Once the new category is uploaded, update the selectedCategory
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial product data
    updateProductNameController.text = widget.product.name;
    updateProductDescriptionController.text = widget.product.description;
    updateProductPriceController.text = widget.product.price.toString();
    _base64Image = widget.product.image;
    if (_base64Image != null) {
      _decodedImage = base64Decode(_base64Image!);
    }
    selectedCategory = widget.product.categoryName; // Set initial category
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Add Product"),
              actions: [
                TextButton(
                  onPressed: _updateProduct,
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                children: [
                  //product images
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: _decodedImage == null
                          ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No image selected.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '(Tap to select image)',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                          : Image.memory(
                        _decodedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //product name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: updateProductNameController,
                        hintText: "Product name",
                        prefixIcon: null,
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //product description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Description",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: updateProductDescriptionController,
                        hintText: "Product description",
                        prefixIcon: null,
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //product price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Price",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
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
                                          "images/nigeria-naira-currency-symbol.png",
                                        ),
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
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextSpace(
                                obscureText: false,
                                controller: updateProductPriceController,
                                keyboardType: TextInputType.number,
                                hintText: "Product price",
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
                      ),
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
                        "Product Quantity",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: updateProductQuantityController,
                        hintText: "How many do you have available",
                        prefixIcon: null,
                        suffixIcon: null,
                      ),
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
                        "Product Size",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: updateProductSizeController,
                        hintText: "XL, L, XXL, 45, 3.5 etc",
                        prefixIcon: null,
                        suffixIcon: null,
                      ),
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
                              left: 10,
                              right: 10,
                              top: 20,
                            ),
                            child: SearchSpace(
                              controller: searchCategoryController,
                              prefixIcon: const Icon(IconlyLight.search),
                              hintText: "Search",
                            ),
                          ),
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
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                            ),
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
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  categories[index].description,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11,
                                                  ),
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
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
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
