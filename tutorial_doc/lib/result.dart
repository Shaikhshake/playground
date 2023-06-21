import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int totalScore = 0;
  VoidCallback resetHandler;
  String text = "Couldn't Finish :(";
  Result(this.totalScore, this.resetHandler);

  String getText(int score) {
    if (score < 4) {
      return "CheapSkate";
    } else if (score < 6) {
      return "Not Bad for a first time";
    } else {
      return "I like you already";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        Text(
          getText(totalScore),
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 3, 116, 114)),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: resetHandler,
            child: const Text("Restart Quiz"))
      ],
    ));
  }
}
