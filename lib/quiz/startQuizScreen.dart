import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/result.dart';
import 'package:flutterQuizeApp/sql/model.dart';
import '../sql/DBSQLITE.dart';

class startQuizScreen extends StatefulWidget {
  const startQuizScreen({Key? key}) : super(key: key);

  @override
  State<startQuizScreen> createState() => _startQuizScreenState();
}

class _startQuizScreenState extends State<startQuizScreen> {
  int i = 1;
  int sum = 0;
  int page = 0;
 
  late PageController pageController;
  late DatabaseLite dbHelper;
   List<Question>? questions;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    dbHelper = DatabaseLite();
    loadQuestions();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> loadQuestions() async {
    questions = await dbHelper.getQuestions();
    setState(() {});
  }

  void answerSelected(String selectedOption) {
    final currentQuestion = questions![page];
    if (currentQuestion.S.toLowerCase() == selectedOption.toLowerCase()) {
      sum++;
    }

    if (page + 1 == questions?.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Result(score: sum)),
      );
    } else {
      pageController.jumpToPage(page + 1);
    }
  }

  Widget buildQuestionPage(Question question) {
  
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
                color: Colors.teal,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(question.name,style: TextStyle(color: Colors.white,
                 fontWeight: FontWeight.w600,fontSize: 20),),
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () => answerSelected('A'),
              child: Container(
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.A),
                ),
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () => answerSelected('B'),
              child: Container(
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.B),
                ),
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () => answerSelected('C'),
              child: Container(
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.C),
                ),
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () => answerSelected('D'),
              child: Container(
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App'),backgroundColor: Colors.teal),
        body: questions!.length >= 5
      ? Column( mainAxisAlignment: MainAxisAlignment.center,
      
          children: [
            SizedBox(height: 8),
            Text.rich(
  TextSpan(
    children: [
      
      TextSpan(
        text: 'Question ${page + 1}  ',
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      
      TextSpan(
        
        text: ' / ${questions!.length}',
        style: TextStyle(
          color: Color.fromARGB(255, 28, 27, 27),
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    ],
  ),
),

      
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: questions!.length,
                itemBuilder: (context, index) {
                  return buildQuestionPage(questions![index]);
                },
                onPageChanged: (index) {
                  setState(() {
                    page = index; // Update the current page number
                  });
                },
              ),
            ),
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

