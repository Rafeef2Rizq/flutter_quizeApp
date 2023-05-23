import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';
import 'package:flutterQuizeApp/sql/datagetx.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late TextEditingController textEditingController3;
  late TextEditingController textEditingController4;
  late TextEditingController textEditingController5;
  List<String> list = <String>['A', 'B', 'C', 'D'];
  String dropdownValue = 'A';

  @override
  void initState() {
    // TODO: implement initState
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    textEditingController4 = TextEditingController();
    textEditingController5 = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    textEditingController3.dispose();
    textEditingController4.dispose();
    textEditingController5.dispose();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<data>(
      id: 'AddQuestion',
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Add New Question'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.black,
                  controller: textEditingController1,
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.question_mark, color: Colors.black),
                      label: Text(
                        'Question',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController2,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              'First Question',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'B',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController3,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              'Second Question',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'C',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController4,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              'third Question',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'D',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.purpleAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController5,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              'Fourth Question',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.teal, width: 1))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Select the  correct Answer'),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (CheckData()) {
                        Question object = newItem();
                        AddNewItem(controller, object);
                      } else {
                        ValedationInput(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Question',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void ValedationInput(BuildContext context) {
    if (textEditingController1.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Question');
    }else if (textEditingController2.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer A');
    }else if (textEditingController3.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer B');
    }else if (textEditingController3.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer C');
    }else if (textEditingController5.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer d');
    }else  {
      ShowSnackBar(
          context: context, Message: 'Required All Answer A,B,C,D');
    }
  }
  void AddNewItem(data controller, Question object) {
    controller.addItem(newItem: object);
    textEditingController1.text = '';
    textEditingController2.text = '';
    textEditingController3.text = '';
    textEditingController4.text = '';
    textEditingController5.text = '';
  }
  Question newItem() {
    Question object = Question();
    object.name = textEditingController1.text;
    object.A = textEditingController2.text;
    object.B = textEditingController3.text;
    object.C = textEditingController4.text;
    object.D = textEditingController5.text;
    object.S = dropdownValue;
    return object;
  }
  bool CheckData() {
    return textEditingController1.text.isNotEmpty &&
                        textEditingController2.text.isNotEmpty &&
                        textEditingController3.text.isNotEmpty &&
                        textEditingController4.text.isNotEmpty &&
                        textEditingController5.text.isNotEmpty;
  }
  void ShowSnackBar({required BuildContext context, required String Message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: 350,
        content: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              Message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
