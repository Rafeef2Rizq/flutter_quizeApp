import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/DBSQLITE.dart';
import 'package:flutterQuizeApp/sql/model.dart';
class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  late TextEditingController textEditingController1=TextEditingController();
  late TextEditingController textEditingController2=TextEditingController();
  late TextEditingController textEditingController3=TextEditingController();
  late TextEditingController textEditingController4=TextEditingController();
  late TextEditingController textEditingController5=TextEditingController();
  List<String> list = <String>['A', 'B', 'C', 'D'];
  String dropdownValue = 'A';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Question'),
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
                  prefixIcon: Icon(Icons.question_mark, color: Colors.teal),
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
              buildCorrectAnswer(),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                 
                  if ( checkData()) {
                  
                    Question object = newItem();
                    addNewItem(DatabaseLite(), object);
                    //  Navigator.of(context).pushNamed("createQuiz");
              
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
          color: Colors.white,
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
              labelText: '${label}th Answer',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
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

  Widget buildCorrectAnswer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Select the correct Answer'),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward,size: 15,color: Color.fromARGB(255, 71, 70, 70)),
          elevation: 15,
          style: const TextStyle(color: Colors.teal),
          underline: Container(
            height: 2,
            color: Colors.teal,
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
    showWarning(context, 'Required Question');
  } else if (textEditingController2.text.isEmpty) {
    showWarning(context, 'Required Answer A');
  } else if (textEditingController3.text.isEmpty) {
    showWarning(context, 'Required Answer B');
  } else if (textEditingController4.text.isEmpty) {
    showWarning(context, 'Required Answer C');
  } else  {
    showWarning(context, 'Required Answer D');
  } 
}

void showWarning(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.red,
    ),
  );
}


void addNewItem(DatabaseLite controller, Question object) async {
    await controller.insertQuestion(
        object); 
        
    setState(() {
      textEditingController1.text = '';
      textEditingController2.text = '';
      textEditingController3.text = '';
      textEditingController4.text = '';
      textEditingController5.text = '';
    });
  }



Question newItem() {
  Question object = Question(
   
    name: textEditingController1.text,
    A: textEditingController2.text,
    B: textEditingController3.text,
    C: textEditingController4.text,
    D: textEditingController5.text,
    S: dropdownValue,
  );
  return object;
}

  bool checkData() {
    return textEditingController1.text.isNotEmpty &&
        textEditingController2.text.isNotEmpty &&
        textEditingController3.text.isNotEmpty &&
        textEditingController4.text.isNotEmpty &&
        textEditingController5.text.isNotEmpty;
  }
}
