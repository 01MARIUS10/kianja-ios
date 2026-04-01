import 'package:flutter/material.dart';
import 'package:kianja/core/utils/input_formatters/phone_formatter.dart';

abstract class AppFunction {
  static String formatPhoneNumber(String phone) {
    const mgMask = '3X XX XXX XX';
    final formatted = PhoneInputFormatter(
      mask: mgMask,
    ).formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: phone));
    return formatted.text;
  }
}
