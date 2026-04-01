import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class AccountMenuCard extends StatelessWidget {
  const AccountMenuCard({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: Constants.spacingMedium),
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.spacingSmall,
        vertical: Constants.spacingSmall,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
      ),
      child: Column(children: children),
    );
  }
}
