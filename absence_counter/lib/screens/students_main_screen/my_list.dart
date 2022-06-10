import 'package:flutter/material.dart';
import 'item.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Item("ASSO", 2, "AMA", "B341", "(TP)"),
             Item("CPAR", 3, "JGB", "B108", "(TP)"),
             Item("LC", 1, "MMFC", "B306", "(PL)"),
             Item("DA", 0, "FMMR", "B107", "(TP)"),
             Item("ESOF", 0, "FBG", "B307", "(PL)"),
          ],
    ),
    );
  }
}
