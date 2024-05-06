import 'package:flutter/material.dart';

class WeeklyTabSection extends StatefulWidget {
  const WeeklyTabSection({super.key});

  @override
  State<WeeklyTabSection> createState() => _WeeklyTabSectionState();
}

class _WeeklyTabSectionState extends State<WeeklyTabSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green
      ),
    );
  }
}
