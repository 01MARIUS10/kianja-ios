import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/presentation/widgets/kara_history_item.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_action_confirmation_dialog.dart';

class KaraHistoryDismissible extends StatelessWidget {
  const KaraHistoryDismissible({
    super.key,
    required this.history,
    required this.onDeleteConfirmed,
  });

  final KaraHistory history;
  final VoidCallback onDeleteConfirmed;

  Future<bool> _confirmDelete(BuildContext context) {
    return MyPostActionConfirmationDialog.show(
      context,
      title: context.appLoc.remove_question,
      message: context.appLoc.remove_history_question,
      confirmLabel: context.appLoc.remove,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(history.id),
      direction: DismissDirection.none,
      resizeDuration: const Duration(milliseconds: 200),
      movementDuration: const Duration(milliseconds: 200),
      confirmDismiss: (direction) async {
        if (direction != DismissDirection.endToStart) return false;

        final confirmed = await _confirmDelete(context);
        if (confirmed) onDeleteConfirmed();
        return false;
      },
      background: const SizedBox.shrink(),
      secondaryBackground: _DismissActionBackground(
        alignment: Alignment.centerRight,
        icon: Icons.delete_outline,
        label: context.appLoc.remove,
        color: AppColors.danger,
      ),
      child: KaraHistoryItem(history: history),
    );
  }
}

class _DismissActionBackground extends StatelessWidget {
  const _DismissActionBackground({
    required this.alignment,
    required this.icon,
    required this.label,
    required this.color,
  });

  final Alignment alignment;
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: color.withValues(alpha: 0.12),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingMedium),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: Constants.spacingExtraSmall),
          Icon(icon, color: color, size: Constants.iconSizeMedium),
        ],
      ),
    );
  }
}
