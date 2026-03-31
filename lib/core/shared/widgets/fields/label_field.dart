import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  const LabelField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: theme.textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
