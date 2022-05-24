import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/menu.dart';
import 'package:my_first_flutter/screens/profile.dart';


class LoginForm extends StatefulWidget{
  @override

  _LoginFormState createState()=>_LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  bool ishiddenPassword=true;
  @override
  Widget build(BuildContext context){
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
                style:Theme.of(context).textTheme.headline3,
          ),
          TextField(
            decoration: InputDecoration(
                hintText:'número de estudante'
            ),
          ),
          TextField(
            obscureText:ishiddenPassword,
            decoration: InputDecoration(
                hintText:'Password',
                    suffixIcon:InkWell(
                      onTap:_togglePasswordView,
                child: Icon(
                  Icons.visibility,
                ),
            ),
            ),
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            onPressed: (){},
            child: Text(
              'Entrar',
            style:TextStyle(
              color:Colors.white,
            ),
            ),
          )

        ],
      ),
    );
  }
  void _togglePasswordView(){
    if(ishiddenPassword==true){
      ishiddenPassword=false;
    }
    else{
      ishiddenPassword=true;
    }

  }
}