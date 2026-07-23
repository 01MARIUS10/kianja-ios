import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class SaveTrainingCenterItemList extends StatelessWidget {
  const SaveTrainingCenterItemList({
    super.key,
    required this.trainingCenter,
    this.onTap,
  });

  final TrainingCenter trainingCenter;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.paddingSmall,
          horizontal: Constants.paddingMedium,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: SizedBox(
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl:
                      '${EnvConfig.baseApiUrl}${trainingCenter.images?.first.url}',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    Assets.hiring,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, e, st) => Container(
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                      child: const Icon(
                        Icons.image,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                ),
              ),
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trainingCenter.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (trainingCenter.location != null)
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: Constants.iconSizeExtraSmall,
                                color: textSecondary,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  trainingCenter.location!.name,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: textSecondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: trainingCenter.user.photoUrl.isNotEmpty
                              ? Image.network(
                                  '${EnvConfig.baseApiUrl}${trainingCenter.user.photoUrl}',
                                  fit: BoxFit.cover,
                                  width: Constants.size35,
                                  height: Constants.size35,
                                  errorBuilder: (_, _, _) =>
                                      const DefaultAvatar(
                                        size: Constants.size35,
                                      ),
                                )
                              : const DefaultAvatar(size: Constants.size35),
                        ),
                        const SizedBox(width: Constants.spacingExtraSmall),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${trainingCenter.user.firstName} ${trainingCenter.user.lastName}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '• ${AppFunction.dateTimeCounter(trainingCenter.createdAt, context)}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
