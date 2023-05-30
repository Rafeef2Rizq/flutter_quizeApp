import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';
import 'package:flutterQuizeApp/drawerPage.dart';
import 'package:flutterQuizeApp/quiz/AddQuestion.dart';
import 'package:flutterQuizeApp/quiz/createQuizScreen.dart';
import 'package:flutterQuizeApp/quiz/startQuizScreen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseLite().initDatabase();
  runApp( MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home: drawerPage(),
      routes:{
        "Add" :(contex)=>AddQuestion(),
        "StartQuiz" :(contex)=>startQuizScreen(),
         "createQuiz" :(contex)=>createQuizScreen(),
      },
    );
  }
}