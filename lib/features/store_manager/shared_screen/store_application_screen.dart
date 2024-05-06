import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/model/store_model.dart';

import '../../../services/store_manager_services.dart';

class StoreNameScreen extends StatefulWidget {
  const StoreNameScreen({Key? key}) : super(key: key);

  @override
  State<StoreNameScreen> createState() => _StoreNameScreenState();
}

class _StoreNameScreenState extends State<StoreNameScreen> {
  String vendorType = "";
  PlatformFile? pickedFile;
  File? _collectionImageFile;
  String? _base64Image;

  final storeNameController = TextEditingController();
  final storeDescriptionController = TextEditingController();
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

  void _registerStore(BuildContext context) async {
    String _errorMessage = '';
    bool _isLoading = false;
    final storeManager =
    StoreManagerService(); // Instantiate StoreManagerService
    final storeName = storeNameController.text.trim();
    final storeDescription = storeDescriptionController.text.trim();
    try {
      await storeManager.registerStore(context, storeName, storeDescription);
    } catch (error) {
      // Handle error, show error message or retry registration
      print('Failed to register store: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Store Details"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
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
                  const Text("Click on the circle to select an image", style: TextStyle(fontSize: 10, color: Colors.grey),),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Store Name",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: storeNameController,
                        hintText: "Enter store name",
                        prefixIcon: const Icon(IconlyLight.home, color: Colors.grey),
                        suffixIcon: null,
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
                        "Store Description",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: storeDescriptionController,
                        hintText: "Enter store description",
                        prefixIcon: const Icon(IconlyLight.document, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                vendorType = "Other Products Vendor";
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor:
                              vendorType == "Other Products Vendor" ? Colors.blue : Colors.grey[200],
                              fixedSize: const Size(50, 50),
                            ),
                            icon: Icon(
                              IconlyBold.bag_2,
                              color: vendorType == "Other Products Vendor" ? Colors.white : Colors.grey,
                            ),
                          ),
                          const Text("Other Products Vendor", style: TextStyle(fontSize: 12),),
                          const Text("(any other products asides from meal)", style: TextStyle(fontSize: 8, color: Colors.grey),),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                vendorType = "Food Vendor";
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor:
                              vendorType == "Food Vendor" ? Colors.blue : Colors.grey[200],
                              fixedSize: const Size(50, 50),
                            ),
                            icon: Icon(
                              Icons.fastfood,
                              color: vendorType == "Food Vendor" ? Colors.white : Colors.grey,
                            ),
                          ),
                          const Text("Food Vendor"),
                          const Text("(only food or food related products)", style: TextStyle(fontSize: 8, color: Colors.grey),),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Spacer(),
                  CustomDefaultButton(
                    title: "Apply",
                    onTap: () {
                      _registerStore(context);
                    },
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
