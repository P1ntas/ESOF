import 'package:flutter/material.dart';
import 'package:uni/screens/classes_screen/classes_item.dart';

class ClassesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClassesItem("ES", "(TP)", "17:00\n18:00"),
        ClassesItem("DA", "(T)", "17:00\n18:00"),
        ClassesItem("LCOM", "(TP)", "17:00\n18:00"),
        ClassesItem("CPAR", "(TP)", "10:00\n13:00"),
      ],
    );
  }
}
