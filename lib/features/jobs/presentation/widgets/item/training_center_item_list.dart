import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class TrainingCenterItemList extends StatelessWidget {
  const TrainingCenterItemList({
    super.key,
    required this.trainingCenter,
    this.badge = TrainingCenterBadge.normal,
    this.onTap,
  });

  final TrainingCenter trainingCenter;
  final TrainingCenterBadge badge;
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
            // Cover image
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: SizedBox(
                width: 110,
                height: 75,
                child: CachedNetworkImage(
                  imageUrl: '${EnvConfig.baseApiUrl}${trainingCenter.imageUrl}',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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

                  // User row + badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // User avatar
                      ClipOval(
                        child: trainingCenter.user.photoUrl.isNotEmpty
                            ? Image.network(
                                '${EnvConfig.baseApiUrl}${trainingCenter.user.photoUrl}',
                                fit: BoxFit.cover,
                                width: Constants.size30,
                                height: Constants.size30,
                                errorBuilder: (_, _, _) =>
                                    const DefaultAvatar(size: Constants.size30),
                              )
                            : const DefaultAvatar(size: Constants.size30),
                      ),
                      // ClipOval(
                      //   child: Image.asset(
                      //     Assets.rabbitAvatar,
                      //     width: Constants.size30,
                      //     height: Constants.size30,
                      //     fit: BoxFit.cover,
                      //     cacheWidth: 60,
                      //     cacheHeight: 60,
                      //     errorBuilder: (ctx, e, st) => Icon(
                      //       Icons.person,
                      //       size: Constants.iconSizeExtraSmall,
                      //       color: textSecondary,
                      //     ),
                      //   ),
                      // ),
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
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Badge
                      if (badge != TrainingCenterBadge.normal)
                        _BadgeChip(badge: badge),
                    ],
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
