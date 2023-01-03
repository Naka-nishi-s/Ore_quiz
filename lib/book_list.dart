import 'package:cloud_firestore/cloud_firestore.dart';

class QuizList {
  QuizList(DocumentSnapshot doc) {
    answer = doc['answer'];
  }

  late String answer;
}
