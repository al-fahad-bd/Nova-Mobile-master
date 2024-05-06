import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nova_mobile/model/store_model.dart';
import 'package:nova_mobile/services/store_manager_services.dart';
import 'package:nova_mobile/services/store_provider.dart';
import 'package:nova_mobile/utilities/custom_loader.dart';
import 'package:provider/provider.dart';

class StoreProfileScreen extends StatefulWidget {
  const StoreProfileScreen({super.key});

  @override
  State<StoreProfileScreen> createState() => _StoreProfileScreenState();
}

class _StoreProfileScreenState extends State<StoreProfileScreen> {
  final storeManagerService = StoreManagerService();
  @override
  Widget build(BuildContext context) {
    // final store = Provider.of<StoreProvider>(context).storeModel;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Store Profile"
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Store>(
        future: storeManagerService.fetchStoreInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomLoader());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final store = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Store Name: ${store.storeName}'),
                  Text('Store Description: ${store.storeDescription}'),
                  Text('Owner: ${store.owner}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
