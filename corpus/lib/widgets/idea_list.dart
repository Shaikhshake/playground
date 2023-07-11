import 'package:flutter/material.dart';
import '../widgets/idea_tile.dart';
import '../models/ideas.dart';
import './idea_tile.dart';

class IdeaList extends StatelessWidget {
  List<Ideas> ideaList;
  IdeaList({required this.ideaList});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        height: mediaQuery.size.width * 0.3,
        padding: EdgeInsets.all(10),
        child: ideaList.isEmpty
            // TODO: implement what happens when no projects exist yet
            ? Text("No Ideas")
            : ListView(
                scrollDirection: Axis.horizontal,
                children: ideaList.map<Widget>((idea) {
                  return IdeaTile(idea: idea,);
                }).toList(),
              ));
    ;
  }
}
