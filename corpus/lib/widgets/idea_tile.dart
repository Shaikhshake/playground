import 'package:flutter/material.dart';
import '../models/ideas.dart';

class IdeaTile extends StatelessWidget {
  final Ideas idea;
  IdeaTile({required this.idea});

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
          color: Color.fromARGB(255, 240, 224, 254),
          //surfaceTintColor: Colors.pink,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: ListTile(
                title: Container(
                  height: mediaQuery.size.width * 0.09,
                  width: mediaQuery.size.width * 0.09,
                  child: Text(
                    idea.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        //color: Color.fromARGB(255, 209, 225, 237),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                subtitle: Text(
                  idea.description,
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: CircleAvatar(
                  backgroundImage: idea.logo,
                  maxRadius: mediaQuery.size.width * 0.06,
                ),
              ),
            ),

          ]),
        ),
      );
    });
  }
}
