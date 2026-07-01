import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key, required this.balance, this.onTransfer});

  final String balance;
  final VoidCallback? onTransfer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surface = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final textPrimary = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Container(
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(Constants.borderRadiusLarge),
        border: Border.all(color: border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -18,
            child: _blob(AppColors.success.withValues(alpha: 0.18), 90),
          ),
          Positioned(
            right: 10,
            bottom: -36,
            child: _blob(AppColors.kara.withValues(alpha: 0.22), 120),
          ),
          Positioned(
            right: -12,
            bottom: 14,
            child: _blob(Colors.teal.withValues(alpha: 0.12), 70),
          ),
          Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.success.withValues(alpha: 0.12),
                    border: Border.all(
                      color: AppColors.success.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(Assets.kara, fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: Constants.spacingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        balance,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: textPrimary,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Available balance',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: textSecondary,
                        ),
                      ),
                      const SizedBox(height: Constants.spacingSmall),
                      SizedBox(
                        height: Constants.size40,
                        child: ElevatedButton(
                          onPressed: onTransfer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Constants.borderRadiusMedium,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingLarge,
                            ),
                          ),
                          child: Text(
                            'Transfer',
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _blob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}
