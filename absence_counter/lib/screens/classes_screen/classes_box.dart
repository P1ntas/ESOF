import 'package:flutter/material.dart';
import 'classes_list.dart';

class ClassesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClassesList(),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 40),
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white10,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              5.0,
              5.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ), //BoxDecoration
    );
  }
}
