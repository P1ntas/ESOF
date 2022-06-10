import 'package:flutter/material.dart';
import 'item.dart';

class Students_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Item("Afonso da Silva Pinto", "202008014"),
          Item("Ana Catarina da Silva Oliveira", "202009029"),
          Item("David dos Santos Ferreira", "202006302"),
          Item("Diogo Pinheiro Almeida", "202006059"),
          Item("João Miguel Ferreira de Araújo Pinto Correia", "201905892"),
          Item("Jorge Carlos Baptista Duarte", "200801677"),
          Item("Linda Inês de Pina Marques Rodrigues", "202005545"),
          Item("Marcelo Guarniero Apolinário", "201603903"),
          Item("Mónica Moura Pereira", "201905753"),
          Item("Rafael Nuno Grilo Morgado", "201506449"),
        ],
      ),
    );
  }
}