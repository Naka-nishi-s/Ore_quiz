import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_quiz/book_list.dart';

class MainModel extends ChangeNotifier {
  List<Map<String, QuizList>> quiz_lists = [];

  Future<void> fetchQuiz() async {
    final docs =
        await FirebaseFirestore.instance.collection('quiz_lists').get();
  }
}
