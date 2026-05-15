import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.autovalidateMode,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      maxLength: maxLength,
      style: theme.textTheme.bodyMedium,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
