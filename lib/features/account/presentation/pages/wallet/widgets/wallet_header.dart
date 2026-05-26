import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';

class WalletHeaderDelegate extends SliverPersistentHeaderDelegate {
  const WalletHeaderDelegate({
    required this.maxExtent,
    required this.minExtent,
    required this.availableBalance,
    required this.balanceLabel,
  });

  @override
  final double maxExtent;
  @override
  final double minExtent;
  final String availableBalance;
  final String balanceLabel;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final showAction = progress < 0.65;

    return SizedBox(
      height: maxExtent,
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 1 - progress,
                child: _buildExpandedCard(context, showAction),
              ),
              Opacity(opacity: progress, child: _buildCollapsedCard(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedCard(BuildContext context, bool showAction) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: maxExtent - minExtent + 24,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.06 * 255).round()),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(41),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'M',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(balanceLabel, style: theme.textTheme.bodySmall),
                    const SizedBox(height: 4),
                    Text('Kara', style: theme.textTheme.titleMedium),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kara.withAlpha(36),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    'Kara',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.kara,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              availableBalance,
              style: theme.textTheme.headlineLarge?.copyWith(fontSize: 34),
            ),
            const SizedBox(height: 10),
            Text('Available balance', style: theme.textTheme.bodyMedium),
            const Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: showAction ? 1 : 0,
              child: Visibility(
                visible: showAction,
                child: SizedBox(
                  width: 152,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Transfer'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedCard(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: minExtent - 10,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.05 * 255).round()),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(41),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Text(
                  'M',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightPrimary,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(balanceLabel, style: theme.textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text(
                    availableBalance,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.kara.withAlpha(46),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'Kara',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.kara,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant WalletHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent ||
        availableBalance != oldDelegate.availableBalance ||
        balanceLabel != oldDelegate.balanceLabel;
  }
}
