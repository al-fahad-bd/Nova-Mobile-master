import 'package:flutter/material.dart';

class PeriodicTab extends StatefulWidget {
  const PeriodicTab({super.key});

  @override
  State<PeriodicTab> createState() => _PeriodicTabState();
}

class _PeriodicTabState extends State<PeriodicTab> {
  String selectedTab = "Today";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedTab = "Today";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: selectedTab == "Today" ? Colors.grey.withOpacity(0.1) : Colors.transparent)
                    ),
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectedTab == "Today" ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: selectedTab == "Today" ? 13 : 14
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedTab = "Weekly";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: selectedTab == "Weekly" ? Colors.grey.withOpacity(0.1) : Colors.transparent)
                    ),
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                          color: selectedTab == "Weekly" ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Weekly",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: selectedTab == "Weekly" ? 13 : 14
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedTab = "Monthly";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: selectedTab == "Monthly" ? Colors.grey.withOpacity(0.1) : Colors.transparent)
                    ),
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                          color: selectedTab == "Monthly" ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          "Monthly",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: selectedTab == "Monthly" ? 13 : 14
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
