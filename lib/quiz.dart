import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function answerQuestion;
  final List<Map<String, Object>> questions;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerQuestion(answer['score']),
                answer['text'] as String))
            .toList()
      ],
    ));
  }
}
