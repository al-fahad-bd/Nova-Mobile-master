import 'package:flutter/material.dart';
import 'package:nova_mobile/features/store_manager/goods_store_manager/screen/add_collections_screen.dart';

class StoreCollectionsListScreen extends StatefulWidget {
  const StoreCollectionsListScreen({super.key});

  @override
  State<StoreCollectionsListScreen> createState() => _StoreCollectionsListScreenState();
}

class _StoreCollectionsListScreenState extends State<StoreCollectionsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddCollectionsScreen()));
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
          ),
          child: const Center(
            child: Icon(Icons.add, color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
