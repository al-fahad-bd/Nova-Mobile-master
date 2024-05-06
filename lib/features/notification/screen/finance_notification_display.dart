import 'package:flutter/material.dart';
import 'package:nova_mobile/features/notification/components/finance_notification_display_style.dart';

class FinanceNotificationDisplay extends StatefulWidget {
  const FinanceNotificationDisplay({super.key});

  @override
  State<FinanceNotificationDisplay> createState() => _FinanceNotificationDisplayState();
}

class _FinanceNotificationDisplayState extends State<FinanceNotificationDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return const FinanceNotificationDisplayStyle();
              },
            ),
          )
        ],
      ),
    );
  }
}
