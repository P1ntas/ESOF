import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_flutter/screens/teacher_main_screen/checkbox.dart';

void main() {

  test('CheckBox should not be checked', () {
    expect(MyCheckBox().isChecked, false);
  });
}