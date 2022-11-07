import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => {
          _questionIndex += 1,
        });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What is your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'White', 'score': 5},
          {'text': 'Red', 'score': 1}
        ]
      },
      {
        'questionText': 'What is your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 10},
          {'text': 'Cat', 'score': 5},
          {'text': 'Bear', 'score': 1}
        ]
      },
      {
        'questionText': 'Who is your favorite instructor?',
        'answers': [
          {'text': 'Sebastian', 'score': 5},
          {'text': 'Alejandro', 'score': 1},
          {'text': 'Chisco', 'score': 10}
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
          actions: [],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
