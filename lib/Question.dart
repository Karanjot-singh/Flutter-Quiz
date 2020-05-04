import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  String questionText;
  Question(this.questionText);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 38),
        textAlign: TextAlign.center,
      ),
    );
  }
}
