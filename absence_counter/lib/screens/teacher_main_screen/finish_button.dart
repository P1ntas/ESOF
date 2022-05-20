import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/mainPage.dart';

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Text(
              'Terminar',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.red.shade900,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainPage()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red.shade900)
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.centerRight,
      width: 300,
      height: 70,
    );
  }
}
