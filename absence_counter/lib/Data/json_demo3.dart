import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

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


void main() async {
  stdout.write('Enter your username: ');
  String? username  = stdin.readLineSync();
  stdout.write('Enter your password: ');
  String? password  = stdin.readLineSync();
  if (username != null &&  password != null) {
    var userCode = await login(username, password);
    print(userCode);
  }
}