import 'dart:math';

import 'package:flutter/services.dart';

class DateTimeInputFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // print(newValue.text.substring(newValue.text.length - 1));
    // if (!RegExp(r'[0-9]').hasMatch(newValue.text.replaceAll('/', ''))) {
    //   return oldValue;
    // }
    var text = _format(newValue.text, '/');
    return newValue.copyWith(
        text: text, selection: _updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection _updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
