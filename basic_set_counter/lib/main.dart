import 'package:flutter/material.dart';

void main() {
  runApp(BasicSetCounter());
}

class BasicSetCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _BasicSetCounterState();
  }
}

class _BasicSetCounterState extends State<BasicSetCounter> {
  int _repCount = 0;
  void _incRepCount() {
    setState(() {
      _repCount++;
    });
  }

  void _resetRepCount() {
    setState(() {
      _repCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Reps for Some Exercise",
                style: TextStyle(color: Color.fromARGB(255, 158, 97, 5)),
              ),
              backgroundColor: const Color.fromARGB(255, 225, 183, 54),
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    Text("You have $_repCount reps!"),
                    ElevatedButton.icon(
                        onPressed: _incRepCount,
                        icon: const Icon(Icons.plus_one),
                        label: const Text("One More!!")),
                    ElevatedButton(
                        onPressed: _resetRepCount, child: const Text("Start Over!"))
                  ],
                ))));
  }
}
