import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String _students_name, _students_no;
  bool is_missing = false;

  Item(this._students_name, this._students_no);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.account_box_rounded, size: 50),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_students_name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
                Text(_students_no,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "OpenSans")),
              ],
            ),
          ),
          Checkbox(
            value: this.is_missing,
            onChanged: (value) {
            },
            activeColor: Colors.red.shade900,
          ),
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
