import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/routing/routes.dart';

class LogoHeader extends StatelessWidget implements PreferredSizeWidget {
  const LogoHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(
          Constants.paddingMedium,
          Constants.paddingSmall,
          Constants.spacingZero,
          Constants.paddingSmall,
        ),
        child: InkWell(
          onTap: () {
            context.pushNamed(Routes.about.name);
          },
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
      ),
      title: Text(title, style: theme.textTheme.headlineMedium),
      centerTitle: false,
      titleSpacing: Constants.spacingMedium,
      actions: [
        IconButton(
          onPressed: () {
            context.pushNamed(Routes.modifyAppLang.name);
          },
          icon: const Icon(Icons.language),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
