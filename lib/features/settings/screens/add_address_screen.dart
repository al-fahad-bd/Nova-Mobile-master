import 'package:flutter/material.dart';
import 'package:nova_mobile/components/text_space.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final countryNameController = TextEditingController();
  final blockNumberController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final stateController = TextEditingController();
  final receiverPhoneNumber = TextEditingController();
  final receiverEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Address"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Save", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextSpace(obscureText: false, controller: countryNameController, hintText: "Country", prefixIcon: null, suffixIcon: null),
                const SizedBox(height: 10,),
                TextSpace(obscureText: false, controller: blockNumberController, hintText: "Block Number", prefixIcon: null, suffixIcon: null),
                const SizedBox(height: 10,),
                TextSpace(obscureText: false, controller: streetController, hintText: "Street", prefixIcon: null, suffixIcon: null),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextSpace(obscureText: false, controller: postalCodeController, hintText: "Postal Code", prefixIcon: null, suffixIcon: null),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextSpace(obscureText: false, controller: stateController, hintText: "State", prefixIcon: null, suffixIcon: null),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                TextSpace(obscureText: false, controller: receiverPhoneNumber, hintText: "Receiver Phone Number", prefixIcon: null, suffixIcon: null),
                const SizedBox(height: 10,),
                TextSpace(obscureText: false, controller: receiverEmail, hintText: "Receiver Email", prefixIcon: null, suffixIcon: null),
              ],
            )
          ],
        ),
      ),
    );
  }
}
