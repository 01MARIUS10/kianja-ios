import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/input_formatters/phone_formatter.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  static const List<_Country> countries = [
    _Country(
      name: 'Madagascar',
      code: 'mg',
      flag: '🇲🇬',
      dialCode: '+261',
      hint: '3X XX XXX XX',
    ),
    _Country(
      name: 'France',
      code: 'fr',
      flag: '🇫🇷',
      dialCode: '+33',
      hint: '6X XX XX XX XX',
    ),
    _Country(
      name: 'UK',
      code: 'en',
      flag: '🇬🇧',
      dialCode: '+44',
      hint: '7XXX XXX XXX',
    ),
  ];
  late _Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = countries[0];
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      onChanged: _onInputChanged,
      style: theme.textTheme.bodyMedium,
      inputFormatters: [PhoneInputFormatter(mask: _selectedCountry.hint)],
      decoration: InputDecoration(
        hintText: _selectedCountry.hint,
        hintStyle: theme.textTheme.bodyMedium,
        prefixIcon: _buildPrefixIcon(theme),
      ),
    );
  }

  Widget _buildPrefixIcon(ThemeData theme) {
    return InkWell(
      onTap: () => _showCountryPicker(theme),
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.paddingMedium,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.icon,
              size: 20,
            ),
            const SizedBox(width: Constants.spacingExtraSmall),
            Text(_selectedCountry.flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: Constants.spacingSmall),
            Text(
              '(${_selectedCountry.dialCode})',
              style: const TextStyle(color: AppColors.icon, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _onInputChanged(String value) {
    if (widget.onChanged != null) {
      // Remove spaces for the callback to provide a clean value
      final String cleanValue = value.replaceAll(RegExp(r'\s'), '');
      // widget.onChanged!(_selectedCountry.dialCode + cleanValue);
      widget.onChanged!('0$cleanValue');
      debugPrint('Clean value: 0$cleanValue');
    }
  }

  void _showCountryPicker(ThemeData theme) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true, // Show from the very bottom of the screen
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...countries.map((country) {
                return ListTile(
                  leading: Text(
                    country.flag,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(
                    '(${country.dialCode})',
                    style: theme.textTheme.bodyLarge,
                  ),
                  trailing: Text(
                    country.name,
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    setState(() {
                      _selectedCountry = country;
                      // Re-apply formatting for the new country mask
                      final String currentDigits = widget.controller.text
                          .replaceAll(RegExp(r'\D'), '');
                      final PhoneInputFormatter formatter = PhoneInputFormatter(
                        mask: _selectedCountry.hint,
                      );
                      final TextEditingValue newTextValue = formatter
                          .formatEditUpdate(
                            TextEditingValue.empty,
                            TextEditingValue(text: currentDigits),
                          );
                      widget.controller.value = newTextValue;
                    });
                    _onInputChanged(widget.controller.text);
                    context.pop();
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _Country {
  const _Country({
    required this.name,
    required this.code,
    required this.flag,
    required this.dialCode,
    required this.hint,
  });
  final String name;
  final String code;
  final String flag;
  final String dialCode;
  final String hint;
}
