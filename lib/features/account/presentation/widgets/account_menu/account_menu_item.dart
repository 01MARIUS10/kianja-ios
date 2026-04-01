import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
        splashColor: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.05),
        highlightColor: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : Colors.black.withValues(alpha: 0.03),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color:
                      iconColor ??
                      (isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
                ),
              ),
              const SizedBox(width: Constants.spacingMedium),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: isDark
                    ? AppColors.darkTextMuted
                    : AppColors.lightTextMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
