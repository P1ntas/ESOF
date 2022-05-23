import 'dart:convert';
import 'package:http/http.dart' as http;

const parkingUrl =
    'https://sigarra.up.pt/feup/pt/instalacs_geral.ocupacao_parques';

void main() async {
  var response =  await http.get(Uri.parse(parkingUrl));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var parkInfo = data["itdc"][0]["resposta"];
    parkInfo.forEach((k,v) => print('${k}: ${v}'));
  } else {
    throw Exception('Failed to read $parkingUrl');
  }
}
