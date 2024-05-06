import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/wallet_screens/components/phone_number_space.dart';

class EnterPhoneNumberSpace extends StatefulWidget {
  final controller;
  final VoidCallback onClick;
  const EnterPhoneNumberSpace({super.key, required this.controller, required this.onClick});

  @override
  State<EnterPhoneNumberSpace> createState() => _EnterPhoneNumberSpaceState();
}

class _EnterPhoneNumberSpaceState extends State<EnterPhoneNumberSpace> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  showModalBottomSheet(context: context, builder: (BuildContext context) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Select Network",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Select your network service provider from the list",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Expanded(
                              child: SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: ListView(
                                  children: const [
                                    ServiceProviderStyle(),
                                    ServiceProviderStyle(),
                                    ServiceProviderStyle(),
                                    ServiceProviderStyle(),
                                    ServiceProviderStyle(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    );
                  });
                });
              },
              child: Container(
                height: 40,
                width: 40,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
            ),
            Icon(IconlyBold.arrow_down_2, color: Colors.grey,)
          ],
        ),
        Expanded(child: PhoneNumberSpace(controller: widget.controller, suffixIcon: IconButton(onPressed: widget.onClick, icon: const Icon(Icons.contact_page, color: Colors.blue,))))
      ],
    );
  }
}

class ServiceProviderStyle extends StatelessWidget {
  const ServiceProviderStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Container(
                height: 38,
                width: 38,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
                ),
              ),
              const SizedBox(width: 10,),
              const Text(
                "MTN",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
