import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_quiz/result.dart';

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => QuizPageState();
}

class QuizPageState extends State<QuizApp> {
  List<QueryDocumentSnapshot> quizList = [];
  int result = 0;
  int number = 0;

  void checkAnswer(int index) {
    if (quizList[number]['answer'] == quizList[number]['select${index + 1}']) {
      result++;
    }
  }

  void nextQuiz() {
    if (number == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ResultApp(result: result)));
    } else {
      setState(() {
        number++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFirstList();
  }

  Future getFirstList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('quiz_lists').get();
    return quizList = snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クイズ画面だよ'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getFirstList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // 読み込み中
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }

            // エラーチェック
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            // データがあったら表示
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(quizList[number]['title']),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            onPressed: (() {
                              checkAnswer(index);
                              nextQuiz();
                            }),
                            child: Text(
                              quizList[number]['select${index + 1}'],
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Text('データがないよ');
            }
          },
        ),
      ),
    );
  }
}
