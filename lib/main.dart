import 'package:flutter/material.dart';//for runApp() and other inbuilt functions

import './Quiz.dart';
import './Result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //list containing map objects
  final _questions = const [
    {
      'questionText': 'Choose one of the following Infinity Stones?',
      'answers': [
        {'text': 'Time Stone', 'score': 10},
        {'text': 'Soul Stone', 'score': 5},
        {'text': 'Mind Stone', 'score': 3},
        {'text': 'Power Stone', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Avenger?',
      'answers': [
        {'text': 'Natasha Romanoff', 'score': 5},
        {'text': 'Ironman', 'score': 11},
        {'text': 'Captain America', 'score': 8},
        {'text': 'Thor', 'score': 9},
      ],
    },
    
    {
      'questionText': 'Choose a Side :',
      'answers': [
        {'text': 'Team Cap', 'score': 10},
        {'text': 'Team Stark', 'score': 18},
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

    //method to reload the build method of the calling widget
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('More questions coming up!');
    } else {
      print('You are all caught up!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( 
          title: Text('QuizIt: Avengers'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz( //see imported files 
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
