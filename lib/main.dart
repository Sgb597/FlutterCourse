import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void _answerQuestion() {
    setState(() => {
          questionIndex = questionIndex + 1,
        });

    print(questionIndex);
  }

  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favorite color?',
        'answers': ['Black', 'White', 'Red']
      },
      {
        'questionText': 'What is your favorite animal?',
        'answers': ['Dog', 'Cat', 'Bear']
      },
      {
        'questionText': 'Who is your favorite instructor?',
        'answers': ['Nat', 'Max', 'John']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('La App del TATA'),
          actions: [],
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]['questionText']),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList()
          ],
        ),
      ),
    );
  }
}
