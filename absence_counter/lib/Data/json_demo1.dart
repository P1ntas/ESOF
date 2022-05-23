import 'dart:convert';

void main() {
  var jsonString = '''[{"name": "john", "score": 40},
                   {"name": "mary", "score": 80}]''';
  var scores = json.decode(jsonString); // List
  for (var score in scores) { // Map
    print('The score of ${score['name']} is ${score['score']}');
    var x = 1;
    print('$x and ${x+1}');
  }
}