import 'package:flutter/material.dart';
import '../teacher_main_screen//menu.dart';
import '../teacher_main_screen//box.dart';
import '../profile.dart';
import 'finish_button.dart';

class TeacherScreen extends StatelessWidget {
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
                margin: const EdgeInsets.only(top: 20, left: 50),
                alignment: Alignment.bottomLeft,
                child: Text("Alunos",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans"))),
            Box(),
            FinishButton(),
          ],
        ));
  }
}
