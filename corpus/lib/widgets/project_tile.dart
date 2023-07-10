// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final Project;
  ProjectTile(this.Project);
  int _langCounter = 0;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: mediaQuery.size.width * 0.35,
        width: mediaQuery.size.width * 0.7,
        padding: EdgeInsets.only(right: 15),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 9,
          color: Color(0xFFBA75FF),
          //surfaceTintColor: Colors.pink,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: ListTile(
                title: Container(
                  height: mediaQuery.size.width * 0.09,
                  width: mediaQuery.size.width * 0.09,
                  child: Text(
                    Project.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        //color: Color.fromARGB(255, 209, 225, 237),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                subtitle: Text(Project.ownerName,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                trailing: Wrap(spacing: 12, children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/flutter.png'),
                    backgroundColor: Colors.white,
                    maxRadius: 15,
                    //child: FittedBox(child: Text(Project.languageUsed[0])),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dart.png'),
                    backgroundColor: Colors.white,
                    maxRadius: 15,
                    //child: FittedBox(child: Text(Project.languageUsed[1])),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/cpp.png'),
                    backgroundColor: Colors.white,
                    maxRadius: 15,
                    //child: FittedBox(child: Text(Project.languageUsed[2])),
                  ),
                ]

                    // children: Project.languageUsed.map<Widget>((ele) {
                    //   return CircleAvatar(
                    //     maxRadius: 15,
                    //     child: FittedBox(child: Text(ele)),
                    //   );
                    // }).toList(),
                    ),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 25, top: 7, bottom: 7),
                child: Text(Project.description, style:TextStyle()),
              ),
          ]),
        ),
      );
    });
  }
}
