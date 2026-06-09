import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

class MyPostJobOfferItemList extends StatelessWidget {
  const MyPostJobOfferItemList({
    super.key,
    required this.jobOffer,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final JobOffer jobOffer;
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
                  imageUrl: '${EnvConfig.baseApiUrl}${jobOffer.image?.url}',
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
                    // Title + location
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobOffer.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Constants.spacingSmall),

                        if (jobOffer.location != null)
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
                                  jobOffer.location!.name,
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

                    // User row + badge
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // User avatar
                        ClipOval(
                          child: jobOffer.user.photoUrl.isNotEmpty
                              ? Image.network(
                                  '${EnvConfig.baseApiUrl}${jobOffer.user.photoUrl}',
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

                        // Name + time
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${jobOffer.user.firstName} ${jobOffer.user.lastName}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: Constants.spacingMedium),
                              Text(
                                '• ${AppFunction.dateTimeCounter(jobOffer.createdAt, context)}',
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
