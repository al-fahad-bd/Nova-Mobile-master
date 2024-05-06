import 'package:flutter/material.dart';

class SalesReportTable extends StatelessWidget {
  const SalesReportTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(color: Colors.grey[200],),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "No",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Product Name",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Sold",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Profit",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Divider(color: Colors.grey[200],),

        ],
      ),
    );
  }
}
