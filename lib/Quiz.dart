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
        // 33 Dynamically choose options for each question. A list of widgets is created . THis
        //function is executed for each element. //'as' used to depict always string, map ()
        // takes anonymous function as args. The map is further cast into list and added to
        // children in column by ... operator

        //<list name>.map(func) executes func on every element of <list name> 
        // The args of func are automatically provided by dart here, answer
        // as to excplicitly define the type, here to show that answers is a list

        // to form a list of widgets from questions
        // ... spread operator appends values to existing list instead of making a nested list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
