import 'package:flutter/material.dart';
import 'package:kianja/core/utils/constants.dart';

class AuthHeader extends StatelessWidget implements PreferredSizeWidget {
  const AuthHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(title, style: theme.textTheme.headlineMedium),
      centerTitle: false,
      titleSpacing: Constants.spacingSmall,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
