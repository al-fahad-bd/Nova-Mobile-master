import 'package:flutter/material.dart';

class PeriodicSelector extends StatelessWidget {
  const PeriodicSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              "Last Week",
              style: TextStyle(
                fontSize: 15
              ),
            ),
            Icon(Icons.arrow_downward_outlined, size: 18,)
          ],
        ),
      ),
    );
  }
}
