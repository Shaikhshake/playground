// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyFirstApp());
}

// class MyFirstApp extends StatelessWidget {
//   void _answerQuestion() {
//     print("Answer Selected");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(title: Text("First App")),
//       body: Column(children: [// note that you cant put fns in const exp
//         Text("Answer these questions"),
//         ElevatedButton(
//           child: Text("Question 1"),
//           onPressed: _answerQuestion,
//         ),
//         ElevatedButton(
//           child: Text("Question 1"),
//           onPressed: _answerQuestion,
//         ),
//         ElevatedButton(
//           child: Text("Question 1"),
//           onPressed: _answerQuestion,
//         ),
//       ]),
//     ));
//   }
// }

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  var _qIndex = 0;
  int _totalScore = 0;
  // var _qList = [
  //   "What is your name like?",
  //   "What color do you like?",
  //   "what is this widget like?",
  // ];
  final _qList = [
    {
      "qText": "What is your name like?",
      "aText": [
        {"text": "Great", "val": 1},
        {"text": "Not-so-great", "val": 2},
        {"text": "Bad", "val": 3},
      ]
    },
    {
      "qText": "What color do you like?",
      "aText": [
        {"text": "Red", "val": 1},
        {"text": "Blue", "val": 2},
        {"text": "Something Else", "val": 3},
      ]
    },
    {
      "qText": "What do you think of this app?",
      "aText": [
        {"text": "It's great for a first App", "val": 1},
        {"text": "It's alright", "val": 2},
        {"text": "I've seen better", "val": 3},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
    print("\n\n\tQindex: $_qIndex, totalscore $_totalScore");
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _qIndex = (_qIndex + 1);
    });
    //print("__qIndex: $_qIndex");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome to The Quiz App"),
            backgroundColor: Color.fromARGB(199, 4, 55, 106),
          ),
          body: _qIndex < _qList.length
              ? Quiz(
                  answerquestion: _answerQuestion, qList: _qList, qIndex: _qIndex)
              : Result(_totalScore, _resetQuiz),
        )
    );
  }
}
