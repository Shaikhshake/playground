import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  String text = "no VAl";
  QuestionWidget(String val) {
    text = val;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   border: Border.all(),
      //   color: Color.fromRGBO(22, 00, 244, .9),
      //   borderRadius: BorderRadius.circular(25)
      // ),
      child: Text(
        text,
        style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 38, 73, 134)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
