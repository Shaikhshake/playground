import 'package:corpus/models/project.dart';
import 'package:corpus/widgets/project_tile.dart';
import 'package:flutter/material.dart';

class ProjectList extends StatelessWidget {
  List<Project> projectList;
  ProjectList({required this.projectList});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        height: mediaQuery.size.width * 0.5,
        padding: EdgeInsets.all(10),
        child: projectList.isEmpty
            // TODO: implement what happens when no projects exist yet
            ? Text("No Projects")
            : ListView(
                scrollDirection: Axis.horizontal,
                children: projectList.map((proj) {
                  return ProjectTile(proj);
                }).toList(),
              ));
  }
}
