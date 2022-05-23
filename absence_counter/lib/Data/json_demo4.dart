import 'dart:convert';
import "package:http/http.dart" as http;
import 'dart:io';

const loginUrl =
    'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

const teacherScheduleUrl =
    'https://sigarra.up.pt/feup/pt/mob_hor_geral.docente';

const studentScheduleUrl =
    'https://sigarra.up.pt/feup/pt/mob_hor_geral.estudante';

class User {
  final String code;
  final String type;
  const User({required this.code, required this.type});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(code: json['codigo'], type: json['tipo']);
  }
}

Future<User?> login(Session session, String username, String password) async {
  var data = await session.post(loginUrl,
       {'pv_login': username, 'pv_password': password});
  if (data["authenticated"]) {
    return User.fromJson(data);
  } else {
    return null;
  }
}

Future<dynamic> getUserSchedule(Session session, User user,
    String dataIni, String dataFim) async {
  var url = (user.type == "F"? teacherScheduleUrl : studentScheduleUrl)
     + "?pv_codigo=${user.code}&pv_semana_ini=$dataIni&pv_semana_fim=$dataFim";
  return await session.get(url);
}

void main() async {
  stdout.write('Enter your username: ');
  String? username  = stdin.readLineSync();
  stdout.write('Enter your password: ');
  String? password  = stdin.readLineSync();
  if (username == null ||  password == null) {
    print("Missing username and/or password.");
    return;
  }
  Session s = new Session();
  User? user = await login(s, username, password);
  if (user != null) {
    var schedule = await getUserSchedule(s, user, "20220515", "20220521");
    print(schedule);
  }
}

// Allows passing cookies between HTTP requests.
class Session {
  Map<String, String> _headers = {}; // stores the cookie

  // Posts data to a url and retrieves the deserialized JSON response.
  // Uses a previously retrieved cookie in the request header, if existent.
  // Saves the cookie retrieved in the response header, if provided.
  Future<dynamic> post(String url, dynamic data) async {
    var response = await http.post(Uri.parse(url), body: data, headers: _headers);
    if (response.statusCode == 200) {
      _updateCookie(response);
      return json.decode(response.body);
    }
    else {
      throw Exception('Failed to access $url');
    }
  }

  // Retrieves the (deserialized) JSON response from a url.
  // Uses a previously retrieved cookie in the request header, if existent.
  Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(url), headers: _headers);
    if (response.statusCode == 200) {
      _updateCookie(response);
      return json.decode(response.body);
    }
    else {
      throw Exception('Failed to access $url');
    }
  }

  // Saves in "headers" the cookie retrieved in the response header.
  void _updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      var sanitizedCookie = rawCookie.replaceAll(",", ";"); //needed with SIGARRA
      _headers['cookie'] = sanitizedCookie;
    }
  }
}