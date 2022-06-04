import 'package:flutter/material.dart';
import '../absenceDataBase.dart';
import '../teacher_main_screen/teachers_screen.dart';

class ClassesItem extends StatelessWidget {
  Future<List<Student>> getStudentsFromDataBase() {
    return students();
  }

  String _class_name, _class_type, _class_room;

  ClassesItem(this._class_name, this._class_type, this._class_room);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var students = await getStudentsFromDataBase();
        print(await students);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TeacherScreen(students)));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(_class_room,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans")),
            Text(_class_name,
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.w300,
                    fontSize: 30.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "OpenSans")),

            Text(_class_type,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
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
      ),
    );
  }
}
