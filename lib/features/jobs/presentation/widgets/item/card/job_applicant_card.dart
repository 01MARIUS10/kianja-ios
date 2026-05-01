import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar_detail.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

class JobApplicantCard extends StatelessWidget {
  const JobApplicantCard({super.key, required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;

    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobApplicant.title,
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.2),
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
                        jobApplicant.location.name,
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
                    const Icon(
                      Icons.computer,
                      size: Constants.iconSizeExtraSmall,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Expanded(
                      child: Text(
                        jobApplicant.category.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.success,
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
                    CircleUserAvatarDetail(user: jobApplicant.user),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${jobApplicant.user.firstName} ${jobApplicant.user.lastName}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '• ${AppFunction.dateTimeCounter(jobApplicant.createdAt)}',
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
