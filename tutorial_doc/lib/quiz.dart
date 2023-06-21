import 'package:flutter/material.dart';

import './questionwidget.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  Function answerquestion;
  var qList;
  var qIndex;
  Quiz(
      {required this.answerquestion,
      required this.qList,
      required this.qIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionWidget(qList[qIndex]["qText"] as String),
        ...(qList[qIndex]["aText"] as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerquestion(answer['val']), answer["text"] as String))
            .toList()
      ],
    );
  }
}
