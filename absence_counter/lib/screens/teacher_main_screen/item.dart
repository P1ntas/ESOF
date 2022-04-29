import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

        ],
      ),
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
