import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';

class JobApplicantCard extends StatelessWidget {
  const JobApplicantCard({
    super.key,
    required this.jobApplicant,
    required this.widthViewEnum,
  });
  final JobApplicant jobApplicant;
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
                const SizedBox(height: Constants.spacingSmall),
                Text(
                  jobApplicant.title,
                  style: theme.textTheme.titleSmall,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Constants.spacingSmall),
                const Divider(),
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
                        jobApplicant.locations
                            .map((location) => location.name)
                            .join(', '),
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
                      Icons.work,
                      size: Constants.iconSizeExtraSmall,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Expanded(
                      child: Text(
                        jobApplicant.categories
                            .map((category) => category.name)
                            .join(', '),
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
                    ClipOval(
                      child: jobApplicant.user.photoUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl:
                                  '${EnvConfig.baseApiUrl}${jobApplicant.user.photoUrl}',
                              fit: BoxFit.cover,
                              width: Constants.size30,
                              height: Constants.size30,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (_, _, _) =>
                                  const DefaultAvatar(size: Constants.size30),
                            )
                          : const DefaultAvatar(size: Constants.size30),
                    ),
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
                            '• ${AppFunction.dateTimeCounter(jobApplicant.createdAt, context)}',
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
