import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  get isChecked => false;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}
bool changeCheckbox(bool isChecked){
  if(isChecked==true){
    return false;
  }
  else{
    return true;
  }
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

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
          isChecked = changeCheckbox(isChecked);
        });
      },
    );
  }

 /* bool changeCheckbox(bool isChecked){
    this.isChecked=isChecked;
    if(isChecked==true){
      return false;
    }
    else{
      return true;
    }
  }*/
}
