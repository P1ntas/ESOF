import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/classes_screen/classes_screen.dart';
import 'package:my_first_flutter/screens/menu.dart';
import 'package:my_first_flutter/screens/profile.dart';
import 'package:my_first_flutter/screens/teacher_main_screen/teachers_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ishiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        actions: [Profile()],
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UNI',
            style: Theme.of(context).textTheme.headline3,
          ),

          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Email',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0))),
          ),
          TextField(
            obscureText: ishiddenPassword,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
              hintText: 'Password',
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.red.shade900)),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ClassesScreen()));
            },

          ),
          FlatButton(
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              onPressed: null)
        ],
      ),
    );
  }

  void _togglePasswordView() {
    if (ishiddenPassword == true) {
      ishiddenPassword = false;
    } else {
      ishiddenPassword = true;
    }
  }
}
