import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';

class DefaultAvatar extends StatelessWidget {
  const DefaultAvatar({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: Icon(
        Icons.person,
        size: size,
        color: isDark
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary,
      ),
    );
  }
}
