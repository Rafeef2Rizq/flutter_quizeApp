import 'package:flutter/material.dart';
import 'package:quize/CreateQuiz.dart';
import 'package:quize/StartCuiz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.greenAccent),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Text(
                      'N',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                accountName: Text('Name'),
                accountEmail: Text('Name@gmail.com')),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateQuiz(),
                    ));
              },
              leading: Icon(Icons.edit),
              title: Text('Create Quiz'),
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SatrtQuiz(),
                  )),
              leading: Icon(Icons.quiz_sharp),
              title: Text('Start Quiz'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Exit'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Image(image: AssetImage("assets/4.png",)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SatrtQuiz(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  minimumSize: Size(160, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text('Let\'s Start !'))
        ],
      ),
    );
  }
}
