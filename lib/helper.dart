import 'package:flutter/material.dart';
import '../sql/DBSQLITE.dart';
class helper extends StatefulWidget {
  int score = 0;

  helper({Key? key, required this.score}) : super(key: key);

  @override
  State<helper> createState() => _helperState();
}

class _helperState extends State<helper> {
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
        MaterialPageRoute(builder: (context) => helper(score: sum)),
      );
    } else {
      pageController.jumpToPage(page + 1);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}