import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  PhoneInputFormatter({required this.mask});
  final String mask;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, return it
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Extract only digits from the new value
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ignore leading zero
    if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }

    // If we're deleting and the digits haven't changed,
    // it means a separator was deleted. We should handle this to avoid getting stuck.
    final String oldDigits = oldValue.text.replaceAll(RegExp(r'\D'), '');
    if (newValue.text.length < oldValue.text.length && digits == oldDigits) {
      if (digits.isEmpty) return newValue;
      // Remove the last digit to effectively "delete" through the separator
      final String truncated = digits.substring(0, digits.length - 1);
      return _applyMask(truncated);
    }

    return _applyMask(digits);
  }

  TextEditingValue _applyMask(String digits) {
    final StringBuffer formatted = StringBuffer();
    int digitIndex = 0;

    for (int i = 0; i < mask.length; i++) {
      if (digitIndex >= digits.length) break;

      final String maskChar = mask[i];
      if (maskChar == 'X' ||
          maskChar == '#' ||
          RegExp(r'\d').hasMatch(maskChar)) {
        formatted.write(digits[digitIndex]);
        digitIndex++;
      } else {
        formatted.write(maskChar);
      }
    }

    final String result = formatted.toString();
    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
