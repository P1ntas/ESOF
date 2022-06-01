import 'package:flutter/material.dart';
import 'item.dart';

class Data {
  final String data;
  const Data({required this.data});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(data: json['horario']);
  }
}

class MyList extends StatelessWidget {
  var _schedule;

  MyList(this._schedule);

  List<Widget> data() {
    List<Widget> list = [];
    print(this._schedule['horario']);

    for (var aula in this._schedule['horario']) {
      // se a cadeira for teorica não conta porque não há faltas
      if (aula['tipo'] != 'T') {
      list.add(Item(aula['ucurr_sigla'], 2, aula['doc_sigla'], aula['sala_sigla'], "("+aula['tipo']+")"));
      }
    }
    return list;// all widget added now retrun the list here
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: data()
    );
  }
}
