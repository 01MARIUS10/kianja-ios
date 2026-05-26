import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar_detail.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';

class JobOfferCard extends StatelessWidget {
  const JobOfferCard({
    super.key,
    required this.jobOffer,
    required this.widthViewEnum,
  });
  final JobOffer jobOffer;
  final WidthViewEnum widthViewEnum;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;

    return Container(
      width: widthViewEnum.width,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cover Image
          Container(
            height: Constants.size150,
            width: double.infinity,
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            child: CachedNetworkImage(
              imageUrl: '${EnvConfig.baseApiUrl}${jobOffer.image?.url}',
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Image.asset(
                  Assets.hiring,
                  fit: BoxFit.fill,
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.image, size: 40, color: Colors.grey),
                );
              },
              progressIndicatorBuilder: (context, url, progress) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(Constants.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  jobOffer.title,
                  style: theme.textTheme.titleSmall,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Constants.spacingSmall),

                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: Constants.iconSizeExtraSmall,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Expanded(
                      child: Text(
                        jobOffer.location?.name ?? '',
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingExtraSmall),

                // Date
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: Constants.iconSizeExtraSmall,
                      color: AppColors.danger.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Expanded(
                      child: Text(
                        AppFunction.getDate(jobOffer.dateLimit),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.danger.withValues(alpha: 0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingSmall),

                // User Details
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleUserAvatarDetail(user: User.empty()),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${jobOffer.user.firstName} ${jobOffer.user.lastName}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '• ${AppFunction.dateTimeCounter(jobOffer.createdAt)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
