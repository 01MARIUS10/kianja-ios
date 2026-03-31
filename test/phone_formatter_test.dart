import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kianja/core/utils/input_formatters/phone_formatter.dart';

void main() {
  group('PhoneInputFormatter', () {
    test('Format Madagascar phone number correctly', () {
      final formatter = PhoneInputFormatter(mask: '3X XX XXX XX');
      const oldValue = TextEditingValue.empty;

      var result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '32'),
      );
      expect(result.text, '32');

      result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '3212'),
      );
      expect(result.text, '32 12');

      result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '321234567'),
      );
      expect(result.text, '32 12 345 67');
    });

    test('Format France phone number correctly', () {
      final formatter = PhoneInputFormatter(mask: '6X XX XX XX XX');
      const oldValue = TextEditingValue.empty;

      var result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '60102'),
      );
      expect(result.text, '60 10 2');

      result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '6010203040'),
      );
      expect(result.text, '60 10 20 30 40');
    });

    test('Format UK phone number correctly', () {
      final formatter = PhoneInputFormatter(mask: '7XXX XXX XXX');
      const oldValue = TextEditingValue.empty;

      var result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '7123456'),
      );
      expect(result.text, '7123 456');

      result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '7123456789'),
      );
      expect(result.text, '7123 456 789');
    });

    test('Handle deletion through a separator', () {
      final formatter = PhoneInputFormatter(mask: '## ##');
      // "12 3" -> delete 3 -> "12"
      // "12 3" -> delete space -> "12" (but digits 123) -> formatter strips last digit -> "12"

      const oldValue = TextEditingValue(
        text: '12 3',
        selection: TextSelection.collapsed(offset: 4),
      );

      // Deleting the separator ' ' at index 2
      const newValue = TextEditingValue(
        text: '123',
        selection: TextSelection.collapsed(offset: 2),
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(
        result.text,
        '12',
      ); // Effectively deleted the digit before the separator
    });

    test('Ignore leading zero', () {
      final formatter = PhoneInputFormatter(mask: '3X XX XXX XX');
      const oldValue = TextEditingValue.empty;

      var result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '032'),
      );
      expect(result.text, '32');

      result = formatter.formatEditUpdate(
        oldValue,
        const TextEditingValue(text: '0'),
      );
      expect(result.text, '');
    });
  });
}
