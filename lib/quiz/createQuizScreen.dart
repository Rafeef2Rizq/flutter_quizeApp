import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/quiz/AddQuestion.dart';

import '../sql/DBSQLITE.dart';

class createQuizScreen extends StatefulWidget {
  const createQuizScreen({Key? key}) : super(key: key);

  @override
  State<createQuizScreen> createState() => _createQuizScreenState();
}

class _createQuizScreenState extends State<createQuizScreen> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  List<Question>? questions;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    await databaseHelper.initDatabase();
    final List<Question> fetchedQuestions = await databaseHelper.getQuestions();
    setState(() {
      questions = fetchedQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddQuestion()),
                );
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
                  Icon(Icons.add),
                  SizedBox(width: 10),
                  Text(
                    'Add new question',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: questions != null && questions!.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
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
                                      questions![index].name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () => showAlertDialog(
                                        context,
                                        questions![index].id.toString(),
                                      ),
                                      child: Icon(Icons.delete,color: Color(0xff9E9E9E),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: questions![index].S == 'A'
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(questions![index].A),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: questions![index].S == 'B'
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(questions![index].B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: questions![index].S == 'C'
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(questions![index].C),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: questions![index].S == 'D'
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(questions![index].D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: questions!.length,
                    )
                  : Center(
                      child: Text(
                        'No questions found.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showAlertDialog(BuildContext context, String questionId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete question'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Are you sure you want to delete this question?'),
                SizedBox(height: 10),
             
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Perform delete operation using databaseHelper
                databaseHelper.deleteQuestion(int.parse(questionId));
                setState(() {
                  // Refresh the questions list
                  questions?.removeWhere(
                      (question) => question.id.toString() == questionId);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}