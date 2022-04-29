import 'package:flutter/material.dart';
import 'item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
      ],
    );
  }
}
