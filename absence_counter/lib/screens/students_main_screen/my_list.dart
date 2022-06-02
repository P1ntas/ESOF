import 'package:flutter/material.dart';
import 'item.dart';

class MyList extends StatelessWidget {
  var _schedule;

  MyList(this._schedule);

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
        list.add(Item(aula['ucurr_sigla'], 2, aula['doc_sigla'],
            aula['sala_sigla'], "(" + aula['tipo'] + ")"));
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
