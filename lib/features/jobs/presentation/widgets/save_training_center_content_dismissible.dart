import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/list/save_training_center_item_list.dart';
import 'package:kianja/features/jobs/presentation/widgets/save_action_confirmation_dialog.dart';

class SaveTrainingCenterContentDismissible extends StatelessWidget {
  const SaveTrainingCenterContentDismissible({
    super.key,
    required this.trainingCenter,
    required this.onUnsavedConfirm,
    this.isProcessing = false,
  });

  final TrainingCenter trainingCenter;
  final VoidCallback onUnsavedConfirm;
  final bool isProcessing;

  Future<bool> _confirmUnsaved(BuildContext context) {
    return SaveActionConfirmationDialog.show(
      context,
      title: context.appLoc.remove_question,
      message: context.appLoc.remove_training_center_question,
      confirmLabel: context.appLoc.remove,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(trainingCenter.id),
      direction: DismissDirection.endToStart,
      resizeDuration: const Duration(milliseconds: 200),
      movementDuration: const Duration(milliseconds: 200),
      confirmDismiss: (direction) async {
        if (isProcessing) return false;

        if (direction == DismissDirection.endToStart) {
          final confirmed = await _confirmUnsaved(context);
          if (confirmed) onUnsavedConfirm();
        }
        return false;
      },
      background: const _DismissActionBackground(
        alignment: Alignment.centerRight,
        label: 'Unsaved',
        color: AppColors.danger,
      ),
      child: Stack(
        children: [
          SaveTrainingCenterItemList(trainingCenter: trainingCenter),
          if (isProcessing)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.08),
                child: const Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DismissActionBackground extends StatelessWidget {
  const _DismissActionBackground({
    required this.alignment,
    required this.label,
    required this.color,
  });

  final Alignment alignment;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: color.withValues(alpha: 0.12),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingMedium),
      child: Text(
        label,
        style: theme.textTheme.titleSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
