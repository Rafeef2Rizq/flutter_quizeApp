import 'dart:developer';

import 'package:get/get.dart';
import 'package:quize/DBSQLITE.dart';

class data extends GetxController{
  static data get to => Get.find();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Item> items = [];

  @override
  void onInit() {
    super.onInit();
    refreshItemList();
  }

  void refreshItemList() async {
    List<Item> itemList = await _databaseHelper.getItems();
        items = itemList;
       update(['AddQuestion']);
   }

  void addItem({required Item newItem}) async {
     await _databaseHelper.insertItem(newItem).then((value) {
       log('$newItem');
     });
     refreshItemList();
  }

  void updateItem(Item item) async {
     await _databaseHelper.updateItem(item);
    refreshItemList();
  }

  void deleteItem(int id) async {
    await _databaseHelper.deleteItem(id);
    refreshItemList();
  }
}