import 'package:flutter/material.dart';

class TodayTabSection extends StatefulWidget {
  const TodayTabSection({super.key});

  @override
  State<TodayTabSection> createState() => _TodayTabSectionState();
}

class _TodayTabSectionState extends State<TodayTabSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey
      ),
    );
  }
}
