import 'package:flutter/material.dart';
import 'item.dart';
import 'finish_button.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Item("Afonso da Silva Pinto", "202008014"),
        Item("David dos Santos Ferreira", "202006302"),
        Item("Afonso da Silva Pinto", "202008014"),
        Item("Afonso da Silva Pinto", "202008014"),
        Item("Afonso da Silva Pinto", "202008014"),
        FinishButton()
      ],
    );
  }
}
