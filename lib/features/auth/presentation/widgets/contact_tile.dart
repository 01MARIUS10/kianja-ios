import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.isDark,
    required this.theme,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final bool isDark;
  final ThemeData theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Colors matching the image design
    final Color selectedBorderColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary; // Primary purple
    final Color unselectedBorderColor = isDark
        ? AppColors.darkBorder
        : Colors.grey.shade300;

    final Color iconColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary; // Purple icon

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(Constants.paddingSmall),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
          border: Border.all(
            color: isSelected ? selectedBorderColor : unselectedBorderColor,
            width: 1.5,
          ),
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
              child: Icon(icon, size: 18, color: iconColor),
            ),
            const SizedBox(width: Constants.spacingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
