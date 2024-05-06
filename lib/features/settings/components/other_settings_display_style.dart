import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OtherSettingsDisplayStyle extends StatelessWidget {
  final String title;
  final Image icon;
  final VoidCallback onClick;

  const OtherSettingsDisplayStyle({
    super.key,
    required this.title,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[000]),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: icon,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: title,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ]),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset("images/feather_chevron_right.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
