import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/datagetx.dart';
import 'package:flutterQuizeApp/result.dart';

class startQuizScreen extends StatefulWidget {
  const startQuizScreen({Key? key}) : super(key: key);

  @override
  State<startQuizScreen> createState() => _startQuizScreenState();
}

class _startQuizScreenState extends State<startQuizScreen> {
  int i = 1;
 
  int sum = 0;
  int page = 0;
  String ans = '';
 late PageController pageController;
 @override
  void initState() {
   pageController = PageController();
   // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
   pageController.dispose();
   // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: data.to.items.isNotEmpty
          ? Column(
              children: [
                Text(
                  'Question ${page+1} / ${data.to.items.length}',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Container(
                  width: double.infinity,
                  height: 360,
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...data.to.items.map((e) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 370,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.teal
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(e.name),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                     if(e.S.toLowerCase()=='a'){
                                       setState(() {
                                         sum++;
                                       });
                                       if(page+1 == data.to.items.length){
                                         log('${page-1 == data.to.items.length}');
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                       }else{
                                         pageController.jumpToPage(page+1);
                                       }
                                     }else{
                                       if(page+1 == data.to.items.length){
                                         log('${page-1 == data.to.items.length}');
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                       }else{
                                         pageController.jumpToPage(page+1);
                                       }
                                     }
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.teal
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.A),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      if(e.S.toLowerCase()=='b'){
                                        setState(() {
                                          sum++;
                                        });
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }else{
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.teal
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.B),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      if(e.S.toLowerCase()=='c'){
                                        setState(() {
                                          sum++;
                                        });
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }else{
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.teal
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.C),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      if(e.S.toLowerCase()=='d'){
                                        setState(() {
                                          sum++;
                                        });
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }else{
                                        if(page+1 == data.to.items.length){
                                          log('${page-1 == data.to.items.length}');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
                                        }else{
                                          pageController.jumpToPage(page+1);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.greenAccent
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.D),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sorry!',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'You must  add at least 5  question to Start!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Image.asset('images/3.png'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: Size(160, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('Back to Home'))
              ],
            ),
    );
  }
}
