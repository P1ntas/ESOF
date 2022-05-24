/*import 'dart:convert';
import 'package:http/http.dart' as http;

const cantinasUrl =
    'https://sigarra.up.pt/feup/pt/mob_eme_geral.cantinas';

void main() async {
  var response = await http.get(Uri.parse(cantinasUrl));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
  } else {
    throw Exception(  'Failed to read $cantinasUrl');
  }
}*/