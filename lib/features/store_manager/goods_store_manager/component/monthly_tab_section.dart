import 'package:flutter/material.dart';

class MonthlyTabSection extends StatefulWidget {
  const MonthlyTabSection({super.key});

  @override
  State<MonthlyTabSection> createState() => _MonthlyTabSectionState();
}

class _MonthlyTabSectionState extends State<MonthlyTabSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.yellow
      ),
    );
  }
}
