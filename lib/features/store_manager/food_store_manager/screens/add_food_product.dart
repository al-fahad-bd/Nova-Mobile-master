import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/search_space.dart';
import 'package:nova_mobile/components/text_space.dart';

class AddFoodProduct extends StatefulWidget {
  const AddFoodProduct({super.key});

  @override
  State<AddFoodProduct> createState() => _AddFoodProductState();
}

class _AddFoodProductState extends State<AddFoodProduct> {
  final foodNameController = TextEditingController();
  final foodDescriptionController = TextEditingController();
  final searchFoodCategoryController = TextEditingController();
  final foodPriceController = TextEditingController();
  final foodIngredientNameController = TextEditingController();
  final foodIngredientDescriptionController = TextEditingController();
  String? _base64Image;
  File? _imageFile;
  File? _foodImageFile;
  String _formattedNumber = '';
  //food image file
  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
        });
        if (_imageFile != null && await _imageFile!.exists()) {
          // Read image bytes and encode as Base64
          List<int> imageBytes = await _imageFile!.readAsBytes();
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

  //food ingredient image file
  Future<void> _getIngredientImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _foodImageFile = File(image.path);
        });
        if (_foodImageFile != null && await _foodImageFile!.exists()) {
          // Read image bytes and encode as Base64
          List<int> imageBytes = await _foodImageFile!.readAsBytes();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Food"),
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
            //food images
            GestureDetector(
              onTap: _getImage,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle
                ),
                child: _imageFile == null
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
                  _imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            //food name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Name",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextSpace(
                    obscureText: false,
                    controller: foodNameController,
                    hintText: "food name",
                    prefixIcon: null,
                    suffixIcon: null),
              ],
            ),
            const SizedBox(height: 10,),
            //food description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Name",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextSpace(
                    obscureText: false,
                    controller: foodDescriptionController,
                    hintText: "product name",
                    prefixIcon: null,
                    suffixIcon: null),
              ],
            ),
            const SizedBox(height: 10,),
            //product price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Price",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1)
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
                          controller: foodPriceController,
                          keyboardType: TextInputType.number,
                          hintText: "product price",
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
            const SizedBox(height: 20,),
            //category
            const SizedBox(
              height: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                // Text(
                //   selectedCategory ??
                //       'Click on the floating action button to select a category',
                //   style: TextStyle(
                //     fontSize: selectedCategory == null ? 11 : 18,
                //     fontWeight: FontWeight.w400,
                //     color: selectedCategory == null
                //         ? Colors.grey
                //         : Colors.black,
                //   ),
                // ),
              ],
            ),
            //ingredient lists
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ingredients",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          //food images
                          GestureDetector(
                            onTap: _getIngredientImage,
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle
                              ),
                              child: _foodImageFile == null
                                  ? const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'No image selected.',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '(Tap to select image)',
                                        style: TextStyle(
                                            fontSize: 5,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ))
                                  : Image.file(
                                _foodImageFile!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          //ingredient name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ingredient Name",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              TextSpace(
                                  obscureText: false,
                                  controller: foodNameController,
                                  hintText: "ingredient name",
                                  prefixIcon: null,
                                  suffixIcon: null),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          //ingredient description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ingredient Description",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              TextSpace(
                                  obscureText: false,
                                  controller: foodNameController,
                                  hintText: "ingredient description",
                                  prefixIcon: null,
                                  suffixIcon: null),
                            ],
                          ),
                          const Spacer(),
                          CustomDefaultButton(title: "Add", onTap: (){
                            Navigator.pop(context);
                          })
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle
              ),
              child: const Center(
                child: Icon(Icons.menu_book_outlined, color: Colors.white,),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
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
                                controller: searchFoodCategoryController,
                                prefixIcon: const Icon(IconlyLight.search),
                                hintText: "Search")),
                        // Expanded(
                        //   child: FutureBuilder<List<CategoryModel>>(
                        //     future: futureCategories,
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const Center(
                        //           child: CustomLoader(),
                        //         );
                        //       } else if (snapshot.hasError) {
                        //         return Center(
                        //           child: Text('Error: ${snapshot.error}'),
                        //         );
                        //       } else {
                        //         List<CategoryModel> categories =
                        //         snapshot.data!;
                        //         return ListView.builder(
                        //           itemCount: categories.length,
                        //           itemBuilder: (context, index) {
                        //             return GestureDetector(
                        //               onTap: () =>
                        //                   _selectCategory(categories[index]),
                        //               child: Container(
                        //                 height: 55,
                        //                 margin: const EdgeInsets.symmetric(
                        //                     horizontal: 10, vertical: 5),
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.grey[200],
                        //                     borderRadius:
                        //                     BorderRadius.circular(10)),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.symmetric(
                        //                       horizontal: 5.0),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                     mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                     children: [
                        //                       Text(
                        //                         categories[index].name,
                        //                         style: const TextStyle(
                        //                             fontSize: 18,
                        //                             fontWeight:
                        //                             FontWeight.w400),
                        //                       ),
                        //                       Text(
                        //                         categories[index].description,
                        //                         style: const TextStyle(
                        //                             color: Colors.grey,
                        //                             fontSize: 11),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             );
                        //           },
                        //         );
                        //       }
                        //     },
                        //   ),
                        // ),
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
                  shape: BoxShape.circle
              ),
              child: const Center(
                child: Icon(Icons.list, color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
  String _formatNumber(int number) {
    NumberFormat formatter = NumberFormat("#,###");
    return formatter.format(number);
  }
}
