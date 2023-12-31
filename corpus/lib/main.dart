// ignore_for_file: prefer_const_constructors

import 'package:corpus/widgets/project_list.dart';
import './models/project.dart';
import './models/ideas.dart';
import './widgets/idea_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Corpus());
}

class Corpus extends StatefulWidget {
  @override
  State<Corpus> createState() => _CorpusState();
}

class _CorpusState extends State<Corpus> {
  final List<Project> projectList = [
    Project(
        title: "Speedo0",
        description: "Building a Fast EV for the urban Environment",
        ownerName: "Not Me",
        languageUsed: ["flutter", "Dart", "C++", "ss", "yy", "sss"]),
    Project(
        title: "Ray",
        description: "An algorithm for complex night lights",
        ownerName: "Someone",
        languageUsed: [
          "flutter",
          "Dart",
          "C++",
        ]),
    Project(
        title: "Wipple",
        description:
            "Innovative way of saving water using proprietary hardware",
        ownerName: "That guy",
        languageUsed: [
          "flutter",
          "Dart",
          "C++",
        ]),
    Project(
        title: "Salon",
        description: "Automated Grooming for the modern Indians",
        ownerName: "This girl",
        languageUsed: [
          "flutter",
          "Dart",
          "C++",
        ]),
    Project(
        title: "Raythe",
        description: "Cool Project",
        ownerName: "My Aunt",
        languageUsed: [
          "flutter",
          "Dart",
          "C++",
        ]),
  ];

  final List<Ideas> ideaList = [
    Ideas(name: "Skin", description: "A soft moisturizer"),
    Ideas(name: "Rubies", description: "A Jewelry shop operated by robots A Jewelry shop operated by robots A Jewelry shop operated by robots A Jewelry shop operated by robots oenoenaohdohyah'ydhoaiehvoyuwfdadadppaphapfhapfafpd"),
    Ideas(name: "Random", description: "Very Random idea"),
    Ideas(
        name: "Repo",
        description:
            "A distributed version control system that actually works"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF8752FF),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                //NavBar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/placeholder_logo.jpg"),
                      //child: FittedBox(child: Text("Logo")),
                    ),
                    //SizedBox(width: 55,),
                    SearchBar(
                      constraints: BoxConstraints(maxWidth: 260),
                    ),
                    //SizedBox(width: 25,),
                    CircleAvatar(
                      backgroundColor: Color(0xFF8752FF),
                      backgroundImage: AssetImage("assets/images/menu.png"),
                      //child: FittedBox(child: Text("Account")),
                    ),
                  ],
                ),
              ),
              //Projects
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 25, top: 15),
                  child: Row(children: const [
                    Text(
                      "Trending Projects",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    //TODO: Get a divider line set up aside of Trending Projects Header
                    //Divider(color: Colors.black, thickness: 4, height: 4,)
                  ]),
                ),
              ),
              ProjectList(projectList: projectList),
              Container(
                padding: EdgeInsets.only(left: 25, top: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending Ideas",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              IdeaList(ideaList: ideaList)
            ],
          ),
        ),
      ),
    );
  }
}
