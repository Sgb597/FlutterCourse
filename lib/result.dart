import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetHandler;

  Result(@required this.finalScore, @required this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';

    if (finalScore <= 8) {
      resultText = 'Normie';
    } else if (finalScore <= 12) {
      resultText = 'Sorta interesting';
    } else if (finalScore <= 16) {
      resultText = 'Getting there';
    } else {
      resultText = 'You down bad homie 🥵';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text('Reset Quiz'),
            onPressed: resetHandler)
      ],
    ));
  }
}
