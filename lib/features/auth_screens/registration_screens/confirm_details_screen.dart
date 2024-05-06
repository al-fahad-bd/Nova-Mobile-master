import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/features/auth_screens/registration_success_screen.dart';
import 'package:nova_mobile/model/user.dart';
import 'package:nova_mobile/services/auth_services.dart';
import 'package:nova_mobile/utilities/custom_loader_overlay.dart';

class ConfirmDetailsScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  final String gender;
  final String age;
  final String phoneNumber;
  final String email;
  final String password;

  const ConfirmDetailsScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  @override
  State<ConfirmDetailsScreen> createState() => _ConfirmDetailsScreenState();
}

class _ConfirmDetailsScreenState extends State<ConfirmDetailsScreen> {
  bool isClicked = false;

  String title = "";
  String _errorMessage = '';
  bool _isLoading = false;

  void registerUser(BuildContext context) async {

    setState(() {
      _isLoading = true;
    });


    final authServices = AuthService();
    final firstName = widget.firstNameValue;
    final lastName = widget.lastNameValue;
    final otherName = widget.otherNameValue;
    String userName = "";
    final gender = widget.gender;
    final age = widget.age;
    final phoneNumber = widget.phoneNumber;
    final email = widget.email;
    final password = widget.password;

    try {
      await authServices.registerUser(context, firstName, lastName, otherName, userName,
          gender, age, phoneNumber, email, password);
      //on success
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
        _isLoading = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Confirm Details"),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          title = "Names";
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Icon(
                                        IconlyLight.profile,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: title == "Names"
                                        ? Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 16; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    )
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            "Names",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      height: title == "Names" ? 110 : 0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "First Name: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.firstNameValue,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Last Name: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.lastNameValue,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Other Name: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.otherNameValue,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          title = "Gender";
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.transgender,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: title == "Gender"
                                        ? Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 8; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    )
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            "Gender",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      height: title == "Gender" ? 50 : 0,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Gender: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.gender,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          title = "Age";
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Icon(
                                        IconlyLight.calendar,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: title == "Age"
                                        ? Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 8; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    )
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            "Age",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      height: title == "Age" ? 50 : 0,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Age: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.age,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          title = "Phone Number";
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Icon(
                                        IconlyLight.call,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: title == "Phone Number"
                                        ? Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 8; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    )
                                        : Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: Container(
                                              height: 4,
                                              width: 4,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  shape: BoxShape.circle),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            "Phone Number",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      height: title == "Phone Number" ? 50 : 0,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Phone Number: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.phoneNumber,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          title = "Email";
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 45,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(
                                    IconlyLight.message,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      height: title == "Email" ? 50 : 0,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Email: ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  widget.email,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomDefaultButton(title: "Register", onTap: (){registerUser(context);}),
                  ],
                ),
              ),
            ),
            if (_isLoading) const CustomLoaderOverlay(),
          ],
        ),
    );
  }
}
