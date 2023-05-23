import 'package:flutter/material.dart';
import 'package:flutterQuizeApp/sql/datagetx.dart';

class result extends StatefulWidget {
  int i = 0 ;
    result({Key? key,required this.i}) : super(key: key);
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.i>data.to.items.length/2?'Congratations!':'Sorry!'}',
            style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          SizedBox(
            height: 4,
          ),
          Image.asset('${widget.i>data.to.items.length/2?'images/1.png':'images/2.png'}'),
          Text(
            'Your Score ${widget.i} / ${data.to.items.length}\nYour\'s a superstar!',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
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
