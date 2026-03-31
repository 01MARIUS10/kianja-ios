import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: Constants.hintTextPassword,
        hintStyle: theme.textTheme.bodyMedium,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: AppColors.icon,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}
