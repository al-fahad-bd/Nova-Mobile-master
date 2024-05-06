import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/cards%20transaction/component/cars_history_style.dart';

class CardOneTransaction extends StatefulWidget {
  const CardOneTransaction({super.key});

  @override
  State<CardOneTransaction> createState() => _CardOneTransactionState();
}

class _CardOneTransactionState extends State<CardOneTransaction> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CardHistoryStyle();
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.0)
          ),
        )
      ],
    );
  }
}
