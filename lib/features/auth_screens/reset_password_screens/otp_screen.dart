import 'package:flutter/material.dart';
import 'package:nova_mobile/features/auth_screens/reset_password_screens/reset_new_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String OTP = "";
  String actualOTP = "2024";

  //button
  Widget otpButtons(int numbers) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 60,
        width: 100,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (OTP.length < 4) {
                OTP += numbers.toString();
              }
            });
          },
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  numbers.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: (){
                  if (OTP == actualOTP) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetNewPasswordScreen()));
                  }
                },
                child: Container(
                  height: 35,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Icon(Icons.check, color: Colors.white,),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const Text(
              "Enter OTP",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            const Text(
              "Please enter the OTP sent to the email you provided",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            border: index < OTP.length
                                ? Border.all(color: Colors.blue)
                                : null),
                        child: index < OTP.length
                            ? Center(
                                child: Text(
                                  OTP[index],
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            : null));
              }),
            ),
            const Spacer(),
            for (int i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(3, (index) => otpButtons(1 + 3 * i + index))
                        .toList(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: const Text("")),
                  ),
                ),
                otpButtons(0),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            OTP =
                                OTP.substring(0, OTP.length - 1);
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.backspace,
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
