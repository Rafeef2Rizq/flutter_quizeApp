import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterQuizeApp/quiz/AddQuestion.dart';
import 'package:flutterQuizeApp/sql/datagetx.dart';

class createQuizScreen extends StatefulWidget {
  const createQuizScreen({Key? key}) : super(key: key);

  @override
  State<createQuizScreen> createState() => _createQuizScreenState();
}

class _createQuizScreenState extends State<createQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: GetBuilder<data>(
        id: 'AddQuestion',
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestion(),));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Create Quiz',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              SizedBox(height: 10,),
              Expanded(
                  child:controller.items.length!=0? ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.items[index].name,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () => showAlertDialog(context,controller.items[index].id.toString()),
                                        child: Icon(Icons.delete)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'A'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].A),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'B'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].B),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'C'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].C),
                                  ),
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S ==  'D'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].D),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.items.length):Center(child: Text('The question bank is empty, fill it in'
                  ),))
            ],
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context,String id) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete question"),
      content: Text("Are you sure want  to delete  this question"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(70, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('cancel')),
        TextButton(
            onPressed: () {
              data.to.deleteItem(int.parse(id));
              Navigator.of(context).pop();
              setState(() {
              });
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(70, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('Delete')),
      ],
    );
    // viser dialogvinduet
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
