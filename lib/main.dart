import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/DBSQLITE.dart';
import 'package:quize/MyHomePage.dart';
import 'package:quize/datagetx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().initDatabase();
  Get.put(data());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}