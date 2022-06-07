import 'package:flutter/material.dart';

import '../absenceDataBase.dart';

class MyCheckBox extends StatefulWidget {
  Student student;

  MyCheckBox(this.student);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState(student);
}

class _MyCheckBoxState extends State<MyCheckBox> {
  Student _student;
  _MyCheckBoxState(this._student);

  bool? isChecked = false;

  void updateDataBase(bool? value) async {
    int tmp_value = 0;
    if (value == true) tmp_value = 1;
    // Update absenceNumber and save it to the database.
    this._student = Student(
      id: this._student.id,
      name: this._student.name,
      absenceNumber: this._student.absenceNumber+1,
    );
    await updateStudent(this._student);

    // Print the updated results.
    print(await students());

  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red.shade500;
      }
      return Colors.red.shade500;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          updateDataBase(value);
        });
      },
    );
  }
}
