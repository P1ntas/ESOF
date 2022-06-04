import 'package:flutter/material.dart';
import 'item.dart';

class Students_List extends StatelessWidget {
  var _students_list;

  Students_List(this._students_list);

  List<Widget> data() {
    List<Widget> list = [];
    for (var student in this._students_list) {
      list.add(Item(student.name, student.id.toString()));
    }
    return list; // all widget added now return the list here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: data(),
      ),
    );
  }
}
