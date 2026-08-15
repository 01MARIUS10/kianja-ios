import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

class MyPostActionConfirmationDialog extends StatelessWidget {
  const MyPostActionConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Ok',
  });

  final String title;
  final String message;
  final String confirmLabel;

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Ok',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => MyPostActionConfirmationDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark
          ? AppColors.darkSurface
          : AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
      ),
      insetPadding: const EdgeInsets.all(Constants.paddingMedium),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(Constants.paddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Constants.spacingSmall),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Constants.spacingMedium),
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Constants.spacingMedium),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: Constants.size50,
                    child: TextButton(
                      onPressed: () => context.pop(true),
                      style: TextButton.styleFrom(
                        backgroundColor: isDark
                            ? Colors.white.withValues(alpha: 0.05)
                            : AppColors.lightSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusMedium,
                          ),
                        ),
                      ),
                      child: Text(
                        confirmLabel,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Constants.spacingMedium),
                Expanded(
                  child: SizedBox(
                    height: Constants.size50,
                    child: ElevatedButton(
                      onPressed: () => context.pop(false),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusMedium,
                          ),
                        ),
                      ),
                      child: Text(
                        context.appLoc.cancel,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
