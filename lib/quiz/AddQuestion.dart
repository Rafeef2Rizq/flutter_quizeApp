import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';

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
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    textEditingController4 = TextEditingController();
    textEditingController5 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    textEditingController3.dispose();
    textEditingController4.dispose();
    textEditingController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  prefixIcon: Icon(Icons.question_mark, color: Colors.black),
                  labelText: 'Question',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.teal, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.teal, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 15),
              buildAnswerRow('A', textEditingController2),
              SizedBox(height: 15),
              buildAnswerRow('B', textEditingController3),
              SizedBox(height: 15),
              buildAnswerRow('C', textEditingController4),
              SizedBox(height: 15),
              buildAnswerRow('D', textEditingController5),
              SizedBox(height: 15),
              buildSelectCorrectAnswerRow(),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (checkData()) {
                    Question object = newItem();
                    addNewItem(DatabaseHelper(), object);
                  } else {
                    validationInput(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Question',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswerRow(String label, TextEditingController controller) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(
            label,
            style: TextStyle(
          
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: getAnswerColor(label),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: '${label}th Question',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.teal, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.teal, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color getAnswerColor(String label) {
    switch (label) {
      case 'A':
        return Colors.orange;
      case 'B':
        return Colors.green;
      case 'C':
        return Colors.blueAccent;
      case 'D':
        return Colors.purpleAccent;
      default:
        return Colors.grey;
    }
  }

  Widget buildSelectCorrectAnswerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Select the correct Answer'),
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
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  void validationInput(BuildContext context) {
    if (textEditingController1.text.isEmpty) {
      ShowSnackBar(
        context: context,
        message: 'Required Question',
      );
    } else if (textEditingController2.text.isEmpty) {
      ShowSnackBar(
        context: context,
        message: 'Required Answer A',
      );
    } else if (textEditingController3.text.isEmpty) {
      ShowSnackBar(
        context: context,
        message: 'Required Answer B',
      );
    } else if (textEditingController4.text.isEmpty) {
      ShowSnackBar(
        context: context,
        message: 'Required Answer C',
      );
    } else if (textEditingController5.text.isEmpty) {
      ShowSnackBar(
        context: context,
        message: 'Required Answer D',
      );
    } else {
      ShowSnackBar(
        context: context,
        message: 'Required All Answer A, B, C, D',
      );
    }
  }

void addNewItem(DatabaseHelper controller, Question object) async {
    await controller.insertQuestion(
        object); // Assuming the method in DatabaseHelper is called addQuestion
    setState(() {
      textEditingController1.text = '';
      textEditingController2.text = '';
      textEditingController3.text = '';
      textEditingController4.text = '';
      textEditingController5.text = '';
    });
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

  bool checkData() {
    return textEditingController1.text.isNotEmpty &&
        textEditingController2.text.isNotEmpty &&
        textEditingController3.text.isNotEmpty &&
        textEditingController4.text.isNotEmpty &&
        textEditingController5.text.isNotEmpty;
  }

  void ShowSnackBar({required BuildContext context, required String message}) {
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
              message,
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