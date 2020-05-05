import 'package:flutter/material.dart';

import './Question.dart';
import './Answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //children is a list of widgets
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        //Dynamically choose options for each answer. A list of widgets is created . THis
        //function is executed for each element. //'as' used to depict always string, map ()
        // takes anonymous function as args. The map is further casted to list and added to
        // children in column by ... operator
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
