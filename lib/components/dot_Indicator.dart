import 'package:flutter/material.dart';

class DotIndicator extends StatefulWidget {
  final bool isActive;

  const DotIndicator({required this.isActive, super.key});

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        decoration: BoxDecoration(
          border: widget.isActive ?Border.all(color: widget.isActive ? Colors.blue : Colors.grey, width: 1) : null,
          shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                color: widget.isActive ? Colors.black : Colors.grey[200],
                shape: BoxShape.circle
            ),
          ),
        ),
      )
    );
  }
}


class BannerIndicator extends StatefulWidget {
  final bool isActive;
  final Color indicatorColor;
  const BannerIndicator({required this.isActive, super.key, required this.indicatorColor});

  @override
  State<BannerIndicator> createState() => _BannerIndicatorState();
}

class _BannerIndicatorState extends State<BannerIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5),
      child: Container(
        height: 8,
        width: widget.isActive ? 30 : 8,
        decoration: BoxDecoration(
            color: widget.indicatorColor,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
