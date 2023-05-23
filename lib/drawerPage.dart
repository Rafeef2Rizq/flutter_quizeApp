// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/quiz/createQuizScreen.dart';
import 'package:flutterQuizeApp/quiz/startQuizScreen.dart';

class drawerPage extends StatefulWidget {
  const drawerPage({Key? key}) : super(key: key);

  @override
  State<drawerPage> createState() => _drawerPageState();
}

class _drawerPageState extends State<drawerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Quiz app'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,foregroundColor: Color.fromARGB(255, 123, 53, 180),
                  child: Center(
                    child: Text(
                      'R',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                accountName: Text('Razan'),
                accountEmail: Text('razan12@gmail.com')),
            ListTile(
               leading: Icon(Icons.edit),
              title: Text('Create Quiz'),
              onTap: () {
                Navigator.push( context, //push mean "انتقل"
                    MaterialPageRoute( // because there is no root it is used to make root
                      builder: (context) {
                        return createQuizScreen();
                      },
                    ));
              },
            ),
            ListTile(
               leading: Icon(Icons.quiz_sharp),
              title: Text('Start Quiz'),
              
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return startQuizScreen();
                    },
                  )),
             
            ),
            Divider(),
            const ListTile(
              leading: Icon(Icons.login_rounded),
              title: Text('Exit'),
            )
          ],
        ),
      ),
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Image.asset('images/home.png', width: 350, height: 350),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return startQuizScreen();
                      },
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                 
                 ),
              child: const Text('Let\'s Start !'))
        ],
      ),
    );
  }
}
