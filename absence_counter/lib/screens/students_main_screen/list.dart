import 'package:flutter/material.dart';
import 'item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Item("ASSO", 2, "AMA", "17:00\n18:00", "(TP)"),
        Item("CPAR", 3, "JGB", "10:00\n13:00", "(TP)"),
        Item("LC", 1, "MMFC", "14:00\n16:00", "(PL)"),
        Item("DA", 0, "FMMR", "16:00\n18:00", "(TP)"),
        Item("ESOF", 0, "FBG", "19:00\n20:00", "(PL)"),
      ],
    );
  }
}
