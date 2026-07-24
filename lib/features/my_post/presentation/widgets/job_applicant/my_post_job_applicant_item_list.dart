import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

class MyPostJobApplicantItemList extends StatelessWidget {
  const MyPostJobApplicantItemList({
    super.key,
    required this.jobApplicant,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final JobApplicant jobApplicant;
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
                  jobApplicant.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Constants.spacingSmall),

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
                        jobApplicant.locations
                            .map((location) => location.name)
                            .join(', '),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingSmall),

                // Row(
                //   children: [
                //     Text(
                //       '${context.appLoc.end} : ',
                //       style: theme.textTheme.bodyMedium?.copyWith(
                //         color: textSecondary,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     // Expanded(
                //     //   child: Text(
                //     //     AppFunction.getDate(jobApplicant.endDate),
                //     //     style: theme.textTheme.bodyMedium?.copyWith(
                //     //       color: AppFunction.isExpired(jobApplicant.endDate)
                //     //           ? AppColors.danger
                //     //           : AppColors.endEvent,
                //     //       fontWeight: FontWeight.w700,
                //     //     ),
                //     //     maxLines: 1,
                //     //     overflow: TextOverflow.ellipsis,
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(height: Constants.spacingMedium),

            // User row + badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // User avatar
                ClipOval(
                  child: jobApplicant.user.photoUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl:
                              '${EnvConfig.baseApiUrl}${jobApplicant.user.photoUrl}',
                          fit: BoxFit.cover,
                          width: Constants.size35,
                          height: Constants.size35,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (_, _, _) =>
                              const DefaultAvatar(size: Constants.size35),
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
                        '${jobApplicant.user.firstName} ${jobApplicant.user.lastName}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: Constants.spacingMedium),
                      Text(
                        '• ${AppFunction.dateTimeCounter(jobApplicant.createdAt, context)}',
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
    );
  }
}
