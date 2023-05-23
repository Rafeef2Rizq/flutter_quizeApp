import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';

class data extends GetxController{
  static data get to => Get.find();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Question> items = [];

  @override
  void onInit() {
    super.onInit();
    refreshItemList();
  }

  void refreshItemList() async {
    List<Question> itemList = await _databaseHelper.questions();
        items = itemList;
       update(['AddQuestion']);
   }

  void addItem({required Question newItem}) async {
     await _databaseHelper.insertItem(newItem).then((value) {
       log('$newItem');
     });
     refreshItemList();
  }

  void updateItem(Question item) async {
     await _databaseHelper.updateItem(item);
    refreshItemList();
  }

  void deleteItem(int id) async {
    await _databaseHelper.deleteItem(id);
    refreshItemList();
  }
}