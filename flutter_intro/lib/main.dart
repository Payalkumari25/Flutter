import 'package:flutter/material.dart';
import 'package:flutter_intro/result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Violet', 'score': 4},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'SkyBlue', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favourite flower?',
      'answers': [
        {'text': 'Lotus', 'score': 1},
        {'text': 'Rose', 'score': 2},
        {'text': 'Lily', 'score': 4},
        {'text': 'jasmin', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favourite place?',
      'answers': [
        {'text': 'Dehradun', 'score': 2},
        {'text': 'Kedarnath', 'score': 1},
        {'text': 'Goa', 'score': 3},
        {'text': 'Dhanotti', 'score': 4}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['hello'];
    // //dummy.add('payal');
    // print(dummy);
    // dummy = [];
    // questions = [];   // does not work if question is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
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
