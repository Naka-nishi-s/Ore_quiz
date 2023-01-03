import 'package:flutter/material.dart';
import 'package:sample_quiz/quiz.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Ore Quiz!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('俺のクイズ'),
            ElevatedButton(
              onPressed: (() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizApp(),
                  ),
                );
              }),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('START'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
