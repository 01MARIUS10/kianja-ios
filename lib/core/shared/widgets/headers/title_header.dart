import 'package:flutter/material.dart';
import 'package:kianja/core/utils/constants.dart';

class TitleHeader extends StatelessWidget implements PreferredSizeWidget {
  const TitleHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: Text(title, style: theme.textTheme.headlineMedium),
      centerTitle: false,
      titleSpacing: Constants.spacingMedium,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
