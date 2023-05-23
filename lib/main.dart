import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';
import 'package:flutterQuizeApp/drawerPage.dart';
import 'package:flutterQuizeApp/sql/datagetx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().initDatabase();
  Get.put(data());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home:  drawerPage(),
    );
  }
}