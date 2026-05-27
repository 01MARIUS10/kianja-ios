import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_action_confirmation_dialog.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_job_applicant_item_list.dart';

class MyPostJobApplicantDismissible extends StatelessWidget {
  const MyPostJobApplicantDismissible({
    super.key,
    required this.jobApplicant,
    required this.onEditConfirmed,
    required this.onDeleteConfirmed,
    this.isProcessing = false,
  });

  final JobApplicant jobApplicant;
  final VoidCallback onEditConfirmed;
  final VoidCallback onDeleteConfirmed;
  final bool isProcessing;

  Future<bool> _confirmEdit(BuildContext context) {
    return MyPostActionConfirmationDialog.show(
      context,
      title: 'Edit ?',
      message: 'Do you want to edit this job applicant?',
      confirmLabel: 'Edit',
    );
  }

  Future<bool> _confirmDelete(BuildContext context) {
    return MyPostActionConfirmationDialog.show(
      context,
      title: 'Remove ?',
      message: 'Do you want to remove this job applicant?',
      confirmLabel: 'Remove',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(jobApplicant.id),
      direction: DismissDirection.horizontal,
      resizeDuration: const Duration(milliseconds: 200),
      movementDuration: const Duration(milliseconds: 200),
      confirmDismiss: (direction) async {
        if (isProcessing) return false;

        if (direction == DismissDirection.startToEnd) {
          final confirmed = await _confirmEdit(context);
          if (confirmed) onEditConfirmed();
        } else if (direction == DismissDirection.endToStart) {
          final confirmed = await _confirmDelete(context);
          if (confirmed) onDeleteConfirmed();
        }
        return false;
      },
      background: const _DismissActionBackground(
        alignment: Alignment.centerLeft,
        icon: Icons.edit_outlined,
        label: 'Edit',
        color: AppColors.info,
      ),
      secondaryBackground: const _DismissActionBackground(
        alignment: Alignment.centerRight,
        icon: Icons.delete_outline,
        label: 'Remove',
        color: AppColors.danger,
      ),
      child: Stack(
        children: [
          MyPostJobApplicantItemList(jobApplicant: jobApplicant),
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
    final isLeft = alignment == Alignment.centerLeft;

    return Container(
      color: color.withValues(alpha: 0.12),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingMedium),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: isLeft
            ? [
                Icon(icon, color: color, size: Constants.iconSizeMedium),
                const SizedBox(width: Constants.spacingExtraSmall),
                Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]
            : [
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
