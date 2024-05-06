import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/screens/add_address_screen.dart';

class BillingAddressScreen extends StatefulWidget {
  const BillingAddressScreen({super.key});

  @override
  State<BillingAddressScreen> createState() => _BillingAddressScreenState();
}

class _BillingAddressScreenState extends State<BillingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Billing Address"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressScreen()));
          }, child: const Text("Add Address", style: TextStyle(color: Colors.blue),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Text(
              "Shipping address",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const AddressDisplayStyle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressDisplayStyle extends StatelessWidget {
  const AddressDisplayStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user's name",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "177 hilltop, ebonyi abakaliki",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "block 117",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "Nigeria",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "delete",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
