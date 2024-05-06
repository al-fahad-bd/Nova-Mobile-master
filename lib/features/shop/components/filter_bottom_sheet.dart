import 'package:flutter/material.dart';
import 'package:nova_mobile/components/custom_default_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Filters",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ],
                  )
                ],
              ),
            ),
            CustomDefaultButton(title: "Apply Filter", onTap: (){})
          ],
        ),
      ),
    );
  }
}
