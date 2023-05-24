import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';
import 'package:flutterQuizeApp/drawerPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseLite().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home: drawerPage(),
    );
  }
}