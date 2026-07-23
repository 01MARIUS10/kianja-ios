import 'package:flutter/material.dart';
import 'package:kianja/core/utils/constants.dart';

class TitleHeader extends StatelessWidget implements PreferredSizeWidget {
  const TitleHeader({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: Text(title, style: theme.textTheme.headlineMedium),
      centerTitle: false,
      titleSpacing: Constants.spacingMedium,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
