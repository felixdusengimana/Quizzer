import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _activeQuestion = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 7},
        {'text': "Red", 'score': 5},
        {'text': "Green", 'score': 3},
        {'text': 'White', 'score': 1},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 7},
        {'text': "Giraffe", 'score': 5},
        {'text': "Dog", 'score': 3},
        {'text': 'Cow', 'score': 1},
        {'text': 'Cat', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite programming language?',
      'answers': [
        {'text': 'C++', 'score': 7},
        {'text': "C", 'score': 5},
        {'text': "Java", 'score': 3},
        {'text': 'Dart', 'score': 1},
        {'text': 'JavaScript', 'score': 10}
      ]
    },
  ];

  void _aswerQuestion(int score) {
    print(_totalScore);
    _totalScore += score;
    setState(() {
      _activeQuestion = _activeQuestion + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _activeQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo'),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: _activeQuestion < _questions.length
              ? Quiz(
                  aswerQuestion: _aswerQuestion,
                  questions: _questions,
                  questionIndex: _activeQuestion,
                )
              : Result(
                  resultScore: _totalScore,
                  restartQuiz: _restartQuiz,
                )),
    );
  }
}
