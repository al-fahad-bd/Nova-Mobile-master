import 'package:flutter/material.dart';

class LongNameHandler extends StatefulWidget {
  final String longText;
  final int maxLength;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  const LongNameHandler({
    Key? key,
    required this.longText,
    required this.maxLength,
    this.weight,
    this.size, this.color,
  }) : super(key: key);

  @override
  State<LongNameHandler> createState() => _LongNameHandlerState();
}

class _LongNameHandlerState extends State<LongNameHandler> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLongText = widget.longText.length > widget.maxLength;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isExpanded
              ? widget.longText
              : widget.longText.substring(
              0, isLongText ? widget.maxLength : widget.longText.length),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.size,
            fontWeight: widget.weight,
          ),
        ),
        if (isLongText)
          const Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: Text(
              '...',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
}
