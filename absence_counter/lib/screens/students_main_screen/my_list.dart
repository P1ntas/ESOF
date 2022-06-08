import 'package:flutter/material.dart';
import 'item.dart';

class MyList extends StatelessWidget {
  var _schedule; var user_id;

  MyList(this._schedule, this.user_id);

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
        list.add(Item(aula['ucurr_sigla'], aula['ocorrencia_id'], aula['doc_sigla'],
            aula['sala_sigla'], "(" + aula['tipo'] + ")", user_id));
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
