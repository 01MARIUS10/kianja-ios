import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar_detail.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';

class TrainingCenterCard extends StatelessWidget {
  const TrainingCenterCard({
    super.key,
    required this.trainingCenter,
    required this.widthViewEnum,
  });
  final TrainingCenter trainingCenter;
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
              imageUrl: '${EnvConfig.baseApiUrl}${trainingCenter.imageUrl}',
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
                  trainingCenter.name,
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
                        trainingCenter.location?.name ?? '',
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingSmall),

                // Domain
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(trainingCenter.domains.length, (
                    index,
                  ) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: trainingCenter.domains[index].icon,
                              width: Constants.iconSizeExtraSmall,
                              height: Constants.iconSizeExtraSmall,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.work_outline),
                            ),
                            const SizedBox(width: Constants.spacingExtraSmall),
                            Expanded(
                              child: Text(
                                trainingCenter.domains[index].name,
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
                      ],
                    );
                  }),
                ),

                // User Details
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
