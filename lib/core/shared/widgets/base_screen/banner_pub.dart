import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class BannerPub extends StatelessWidget {
  const BannerPub({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    return Container(
      width: double.infinity,
      height: Constants.size40,
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingMedium),
      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      child: Row(
        spacing: Constants.spacingSmall,
        children: [
          Container(
            width: Constants.size60,
            height: Constants.size35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: Image.asset(
                Assets.kimsKorea,
                fit: BoxFit.cover,
                cacheWidth: Constants.size150.toInt(),
                cacheHeight: Constants.size70.toInt(),
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.restaurant,
                  color: isDark
                      ? AppColors.darkPrimary
                      : AppColors.lightPrimary,
                  size: Constants.iconSizeSmall,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              'KIMS Restaurant coréen',
              style: theme.textTheme.titleMedium?.copyWith(
                color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
