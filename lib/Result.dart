import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 18) {
      resultText = 'I can do this all day! Captain America';
    } else if (resultScore <= 25) {
      resultText = 'God of Thunder : Thor';
    } else if (resultScore <= 29) {
      resultText = 'You are Dr. strange!';
    } else {
      resultText = 'You relate most with Ironman!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Retake Quiz! 14,000,605 Tries Left.',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}