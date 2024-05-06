import 'package:flutter/material.dart';

import '../component/todays_orders_style.dart';

class AllOrderScreen extends StatefulWidget {
  const AllOrderScreen({super.key});

  @override
  State<AllOrderScreen> createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("All Order"),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue[800],
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.grey,
              dividerHeight: 0,
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Done",
                ),
                Tab(
                  text: "Cancelled",
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //all
                  ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, int index) {
                      return const TodaysOrdersStyle();
                    },
                  ),
                  //pending
                  ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, int index) {
                      return const TodaysOrdersStyle();
                    },
                  ),
                  //done
                  ListView.builder(
                    itemCount: 190,
                    itemBuilder: (context, int index) {
                      return const TodaysOrdersStyle();
                    },
                  ),
                  //cancelled
                  ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, int index) {
                      return const TodaysOrdersStyle();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
