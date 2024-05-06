import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/components/custom_default_button.dart';
import 'package:nova_mobile/components/text_space.dart';
import 'package:nova_mobile/features/auth_screens/registration_screens/phone_number_screen.dart';

class AgeScreen extends StatefulWidget {
  final String firstNameValue;
  final String lastNameValue;
  final String otherNameValue;
  final String gender;

  const AgeScreen({
    super.key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.otherNameValue,
    required this.gender,
  });

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime selectedDate = DateTime.now();
  String displayDate = 'dd/MM/yy';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'Selected Date:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              '${selectedDate.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                elevation: 0
              ),
              child: const Text('Select Date'),
            ),
            const Spacer(),
            CustomDefaultButton(
                title: "Next",
                onTap: () {
                  if (selectedDate.toString() != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneNumberScreen(
                                firstNameValue: widget.firstNameValue,
                                lastNameValue: widget.lastNameValue,
                                otherNameValue: widget.otherNameValue,
                                gender: widget.gender,
                                age: selectedDate.toString())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter your date of birth")));
                  }
                })
          ],
        ),
      ),
    );
  }
}
