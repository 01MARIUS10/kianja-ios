import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class MyPostTrainingCenterItemList extends StatelessWidget {
  const MyPostTrainingCenterItemList({
    super.key,
    required this.trainingCenter,
    this.badge = TrainingCenterBadge.normal,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final TrainingCenter trainingCenter;
  final TrainingCenterBadge badge;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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
            // Cover image
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: SizedBox(
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl:
                      '${EnvConfig.baseApiUrl}${trainingCenter.images.isNotEmpty ? trainingCenter.images.first.url : ''}',
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

            // Content
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
                        // Title
                        Text(
                          trainingCenter.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Constants.spacingExtraSmall),

                        // Location
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
                        const SizedBox(height: Constants.spacingExtraSmall),
                      ],
                    ),

                    // User row + badge
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // User avatar
                        ClipOval(
                          child: Image.asset(
                            Assets.rabbitAvatar,
                            width: Constants.size40,
                            height: Constants.size40,
                            fit: BoxFit.cover,
                            cacheWidth: 80,
                            cacheHeight: 80,
                            errorBuilder: (ctx, e, st) => Icon(
                              Icons.person,
                              size: Constants.iconSizeExtraSmall,
                              color: textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(width: Constants.spacingExtraSmall),

                        // Name + time
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

                        // Badge
                        if (badge != TrainingCenterBadge.normal) ...[
                          _BadgeChip(badge: badge),
                          const SizedBox(width: Constants.spacingExtraSmall),
                        ],
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

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.badge});
  final TrainingCenterBadge badge;

  @override
  Widget build(BuildContext context) {
    final isVip = badge == TrainingCenterBadge.vip;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.paddingSmall,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: isVip ? AppColors.kara : AppColors.success,
        borderRadius: BorderRadius.circular(Constants.borderRadiusLarge),
      ),
      child: Text(
        isVip ? 'VIP' : 'Premium',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
