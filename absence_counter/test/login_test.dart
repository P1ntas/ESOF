import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_flutter/screens/login.dart';

void main() {

  Widget createWidgetForTesting({Widget? child}){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login Page test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new LoginForm()));
    await tester.pumpAndSettle();
    var textField = find.byType(TextField);
    expect(textField, findsWidgets);
  });

  testWidgets('Login Page buttons test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new LoginForm()));
    await tester.pumpAndSettle();
    var button = find.byType(FlatButton);
    expect(button, findsWidgets);
  });

}