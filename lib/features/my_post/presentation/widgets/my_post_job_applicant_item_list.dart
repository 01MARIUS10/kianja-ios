import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

class MyPostJobApplicantItemList extends StatelessWidget {
  const MyPostJobApplicantItemList({
    super.key,
    required this.jobApplicant,
  });

  final JobApplicant jobApplicant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final textSecondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.paddingSmall,
        horizontal: Constants.paddingMedium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // No cover image for job applicant cards (as requested)
          Expanded(
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
                            jobApplicant.location.name,
                            style:
                                theme.textTheme.bodySmall?.copyWith(
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
                const SizedBox(height: Constants.spacingSmall),
                // Motivation preview
                Text(
                  jobApplicant.motivation,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Constants.spacingSmall),
                // User + date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${jobApplicant.user.firstName} ${jobApplicant.user.lastName}',
                            style:
                                theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: Constants.spacingExtraSmall,
                          ),
                          Text(
                            '• ${AppFunction.dateTimeCounter(jobApplicant.createdAt)}',
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
        ],
      ),
    );
  }
}

