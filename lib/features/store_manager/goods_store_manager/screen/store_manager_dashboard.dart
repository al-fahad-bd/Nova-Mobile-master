import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/achievements_card.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/periodic_selector.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/periodic_tab.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/sales_report_item_display_style.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/sales_report_table.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/sum_card.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/component/todays_orders_style.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/store_manager_notification_screen.dart';
import 'package:nova_mobile/features/wallet_screens/components/statistics_card.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/services/store_provider.dart';
import 'package:nova_mobile/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreManagerDashBoard extends StatefulWidget {
  const StoreManagerDashBoard({super.key});

  @override
  State<StoreManagerDashBoard> createState() => _StoreManagerDashBoardState();
}

class _StoreManagerDashBoardState extends State<StoreManagerDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreManagerNotificationScreen()));
          }, icon: const Icon(IconlyLight.notification))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [

            //balance
            Container(
              height: 66,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Icon(Icons.wallet, color: Colors.black,),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Revenue", style: TextStyle(color: Colors.grey, fontSize: 15),),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "images/nigeria-naira-currency-symbol.png",
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "630,000",
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.arrow_upward, color: Colors.green, size: 12,),
                                    Text(
                                      "30%",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 11
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                        child: Text(
                            "details"
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SumCard(title: "Total Visitors", countValue: "783K", grade: "50", rateDirection: true),
                    SumCard(title: "Total Reviews", countValue: "70k", grade: "30", rateDirection: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SumCard(title: "Total Orders", countValue: "879", grade: "70", rateDirection: true),
                    SumCard(title: "Total Views", countValue: "260", grade: "20", rateDirection: false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SumCard(title: "Total Customers", countValue: "839", grade: "64", rateDirection: true),
                    SumCard(title: "Total Sales", countValue: "2,960", grade: "97", rateDirection: false),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Divider(color: Colors.grey[200],),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Overview",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                PeriodicTab()
              ],
            ),
            const SizedBox(height: 10,),
            const StatisticsCard(currencyColor: Colors.black, amount: "785,000", barColor: Colors.yellow, rate: "35", mon: 135, tue: 26, wed: 100, thus: 92, fri: 59, sat: 160, sun: 69),
            const SizedBox(height: 10),
            Divider(color: Colors.grey[200],),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Sold",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                PeriodicSelector()
              ],
            ),
            const SizedBox(height: 10,),
            const SalesReportTable(),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  SizedBox(
                    height: 198,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return const SalesReportItemDisplayStyle();
                      },
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Achievements", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return AchievementsCards();
                      },
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Today's Orders",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 345,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const TodaysOrdersStyle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
