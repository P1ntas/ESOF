import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter/screens/menu.dart';
import 'package:my_first_flutter/screens/profile.dart';
import 'package:my_first_flutter/screens/students_main_screen/students_screen.dart';

const loginUrl =
'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

// Performs login and retrieves the user code if succeeded.
Future<String?> login(String username, String password) async {
  var response = await http.post(Uri.parse(loginUrl),
      body: {'pv_login': username, 'pv_password': password});
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data["authenticated"]) {
      return data['codigo'];
    }
  }
  return null;
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ishiddenPassword = true;

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

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
            controller: username,
            decoration: InputDecoration(
                hintText: 'Username',
                contentPadding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0))),
          ),
          TextField(
            obscureText: ishiddenPassword,
            controller: password,
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
            onPressed: () async {
              if (username.text != null &&  password.text != null) {
                var userCode = await login(username.text, password.text);
                if (userCode != null) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                }
                else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text that the user has entered by using the
                        // TextEditingController.
                        content: Text("Password ou Username Incorretos!"),
                      );
                    },
                  );
                }
              }
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