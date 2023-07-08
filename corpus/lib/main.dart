// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(Corpus());
}

class Corpus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: const [
              CircleAvatar(
                child: FittedBox(child: Text("Logo")),
              ),
              SearchBar(constraints: BoxConstraints(maxWidth: 200),),
              CircleAvatar(
                backgroundColor: Colors.pink,
                child: FittedBox(child: Text("Account")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
