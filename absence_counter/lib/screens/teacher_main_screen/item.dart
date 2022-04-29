import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String _students_name, _students_no;

  Item(this._students_name, this._students_no);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(_students_name+"\n"+_students_no,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "OpenSans")),
        ],
      ),
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
