import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/wallet_screens/components/income_section.dart';
import 'package:nova_mobile/features/wallet_screens/components/expenses_section.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String selectedTab = "Income";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedTab = "Income";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedTab == "Income" ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconlyBold.arrow_down, color: selectedTab == "Income" ? Colors.white : Colors.grey,),
                                Text(
                                  "Income",
                                  style: TextStyle(
                                    color: selectedTab == "Income" ? Colors.white : Colors.grey,
                                    fontSize: 18
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedTab = "Expenses";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedTab == "Expenses" ? Colors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconlyBold.arrow_up, color: selectedTab == "Expenses" ? Colors.white : Colors.grey,),
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                      color: selectedTab == "Expenses" ? Colors.white : Colors.grey,
                                      fontSize: 18
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              child: selectedTab == "Income" ? const IncomeSection() : const ExpensesSection(),
            )
          ],
        ),
      ),
    );
  }
}
