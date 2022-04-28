import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("editar caixas",
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w300,
              fontSize: 30.0,
              fontStyle: FontStyle.normal,
              fontFamily: "OpenSans")),
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
