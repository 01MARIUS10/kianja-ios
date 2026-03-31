import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/utils/constants.dart';

class JobsHeader extends StatelessWidget implements PreferredSizeWidget {
  const JobsHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(Constants.paddingSmall),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
          child: Image.asset(
            Assets.logoKianja,
            fit: BoxFit.cover,
            cacheWidth: Constants.size70.toInt(),
            cacheHeight: Constants.size70.toInt(),
            width: Constants.size45,
            height: Constants.size45,
          ),
        ),
      ),
      title: Text(title, style: theme.textTheme.headlineMedium),
      centerTitle: false,
      titleSpacing: Constants.spacingZero,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
