import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_item.dart';

class ClassesList extends StatelessWidget {
  var _schedule;

  ClassesList(this._schedule);

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
        list.add(ClassesItem(
            aula['ucurr_sigla'], "(" + aula['tipo'] + ")", aula['sala_sigla']));
      }
    }
    return list; // all widget added now retrun the list here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: data()),
    );
  }
}
