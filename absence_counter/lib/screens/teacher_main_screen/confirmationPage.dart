import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/menu.dart';
import 'package:my_first_flutter/screens/profile.dart';


class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        actions: [Profile()],
      ),
      backgroundColor: Colors.white,
      body: new Center(
          child: new Text('Faltas Marcadas',
              style: TextStyle(
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.w400,
                  fontSize: 30.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "OpenSans"))),
    );
  }
}
