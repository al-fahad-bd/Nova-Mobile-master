import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/services/auth_services.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  AuthService authService = AuthService();
  final editFirstName = TextEditingController();
  final editLastName = TextEditingController();
  final editOtherName = TextEditingController();
  final editUserName = TextEditingController();
  final editPhoneNumber = TextEditingController();
  final editEmail = TextEditingController();
  String gender = "";

  File? _imageFile;
  String? _base64Image;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });

      List<int> imageBytes = await _imageFile!.readAsBytes();
      _base64Image = base64Encode(imageBytes);

      // Optionally, you can set the base64 image to another variable or use it as needed.
      // For example:
      // print('Base64 encoded image: $_base64Image');
    }
  }

  Future<void> _updateProfile() async {
    Map<String, dynamic> updates = {
      'firstName': editFirstName.text.trim(),
      'lastName': editLastName.text.trim(),
      'otherName': editOtherName.text.trim(),
      'userName': editUserName.text.trim(),
      'phoneNumber': editPhoneNumber.text.trim(),
      'email': editEmail.text.trim(),
      'gender': gender.trim(),
      // Add any other fields you want to update
    };

    String result = await authService.updateProfile(updates, image: _imageFile);

    // Display result using a SnackBar or any other method
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
        actions: [
          TextButton(onPressed: _updateProfile, child: const Text("Save", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  //profile image
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: _imageFile == null ? Image.asset(
                              "images/item_1.jpg",
                              fit: BoxFit.cover,
                            ) : Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              shape: BoxShape.circle
                            ),
                            child: const Icon(IconlyBold.camera, color: Colors.grey,),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Text("Profile image"),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editFirstName,
                        hintText: "Enter first name",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Last Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editLastName,
                        hintText: "Enter last name",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Other Names",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editOtherName,
                        hintText: "Enter other names",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editUserName,
                        hintText: "Enter user name",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editPhoneNumber,
                        hintText: "Enter phone number",
                        prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpace(
                        obscureText: false,
                        controller: editEmail,
                        hintText: "Enter email",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "Gender",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text("Male"),
                          const SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                gender = "Male";
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: gender == "Male"
                                  ? Colors.blue
                                  : Colors.grey[200],
                              fixedSize: const Size(50, 50),
                            ),
                            icon: Icon(
                              Icons.male,
                              color:
                              gender == "Male" ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Female"),
                          const SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                gender = "Female";
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: gender == "Female"
                                  ? Colors.blue
                                  : Colors.grey[200],
                              fixedSize: const Size(50, 50),
                            ),
                            icon: Icon(
                              Icons.female,
                              color: gender == "Female"
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
