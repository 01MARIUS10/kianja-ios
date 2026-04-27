import 'package:flutter/material.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar_detail.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class JobApplicantCard extends StatelessWidget {
  const JobApplicantCard({super.key});
  // final JobOffer jobOffer;

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
                  'Je cherche un emploi en tant que développeur web',
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.2),
                  maxLines: 3,
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
                        'Antananarivo',
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
                        'Informaticien',
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
                    const CircleUserAvatarDetail(user: User.empty()),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '• 2 jours',
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
