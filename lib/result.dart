import 'package:flutter/material.dart';
import 'package:sample_quiz/start.dart';

class ResultApp extends StatefulWidget {
  const ResultApp({super.key, required this.result});
  final int result;

  @override
  State<ResultApp> createState() => _ResultView();
}

class _ResultView extends State<ResultApp> {
  late int result;
  String result_txt = '';

// 正解数に応じてテキストメッセージを返す
  result_text(int result) {
    if (result == 3) {
      return '全問正解！おめでとう！';
    }

    if (result > 0) {
      return 'なかなかやるね！';
    }

    return 'まだまだだね！';
  }

  @override
  void initState() {
    result = widget.result;
    result_txt = result_text(result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('結果は: $result 問正解'),
            Text('$result_txt'),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StartPage()));
                }),
                child: Text('最初にもどる'))
          ],
        ),
      ),
    );
  }
}
