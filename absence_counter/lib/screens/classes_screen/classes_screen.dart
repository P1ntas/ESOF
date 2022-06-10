import 'package:flutter/material.dart';
import 'package:uni/screens/classes_screen/classes_box.dart';
import 'package:uni/screens/teacher_main_screen/menu.dart';
import '../profile.dart';

class ClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text(
            "Uni",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          actions: [Profile()],
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30, left: 50),
                alignment: Alignment.bottomLeft,
                child: Text("Unidades Curriculares",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"))),
            ClassesBox(),
          ],
    ));
  }
}