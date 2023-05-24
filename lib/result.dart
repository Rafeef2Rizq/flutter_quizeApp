
import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/drawerPage.dart';
import '../sql/DBSQLITE.dart';
class Result extends StatefulWidget {
  int score = 0;

  Result({Key? key, required this.score}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
   int i = 1;
  int sum = 0;
  int page = 0;
 
  late PageController pageController;
  late DatabaseLite dbHelper;
   late List<Question> questions=[];
     void initState() {
    super.initState();
    pageController = PageController();
    dbHelper = DatabaseLite();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    questions = await dbHelper.getQuestions();
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    // Total number of questions

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  Image.asset('${widget.score>totalQuestions/2?'images/1.png':'images/2.png'}'),
          Text(
            '${widget.score > questions.length / 2 ? 'Congratulations!' : 'Oops!'}',
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Image.asset(
            '${widget.score > questions.length / 2 ? 'images/1.png' : 'images/2.png'}',
          ),
          Text(
            'Your Score: ${widget.score} / ${questions.length}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
             Text(
               '${widget.score > questions.length / 2 ? 'You\'re a superstar!' : 'Sorry,better luck next time'}',
           
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return drawerPage();
                    },
                  )),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              minimumSize: Size(160, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}