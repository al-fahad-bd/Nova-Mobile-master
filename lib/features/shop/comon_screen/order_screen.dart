import 'package:flutter/material.dart';
import 'package:nova_mobile/features/settings/screens/settings_screen.dart';
import 'package:nova_mobile/features/shop/screens/orders_section.dart';
import 'package:nova_mobile/features/shop/screens/returns_section.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Order"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Divider(color: Colors.grey[200],),
            TabBar(
              indicatorColor: Colors.blue[800],
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.grey,
              dividerHeight: 0,
              tabs: const [
                Tab(text: "Orders",),
                Tab(text: "Returns",),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  //on the way
                  OrdersSection(),
                  //delivered
                  ReturnsSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
