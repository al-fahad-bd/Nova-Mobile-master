import 'package:flutter/material.dart';
import 'package:nova_mobile/features/notification/screen/finance_notification_display.dart';
import 'package:nova_mobile/features/notification/screen/social_notification_display.dart';
import 'package:nova_mobile/features/shop/food/components/food_notification_style.dart';
import 'package:nova_mobile/features/shop/food/screens/food_notification_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("Notification"),
          ),
          body: Column(
            children: [
              TabBar(
                indicatorColor: Colors.blue[800],
                labelColor: Colors.blue[800],
                unselectedLabelColor: Colors.grey,
                dividerHeight: 0,
                tabs: const [
                  Tab(text: "All",),
                  Tab(text: "Social",),
                  Tab(text: "Finance",),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //all
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: 20,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return const FoodNotificationStyle();
                          },
                        ),
                      ),
                    ),
                    //social
                    //finance

                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
