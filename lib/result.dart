import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartQuiz;

  Result({required this.resultScore, required this.restartQuiz});

  String get resultPhrase {
    String resultText;
    print("Score: " + resultScore.toString());
    if (resultScore <= 8) {
      resultText = 'You\'re awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You\'re .... strange?';
    } else {
      resultText = 'You\'re so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: restartQuiz,
            child: Text("Restart Quiz"),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
