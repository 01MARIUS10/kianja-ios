import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/routing/routes.dart';

/// Displays up to 3 [TrainingCenter] items as VIP cards in a horizontal row.
class TrainingCenterVipSection extends StatelessWidget {
  const TrainingCenterVipSection({super.key, required this.vipCenters});

  final List<TrainingCenter> vipCenters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    // Only show max 3 VIP items
    final items = vipCenters.take(3).toList();

    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        // Padding(
        //   padding: const EdgeInsets.only(
        //     left: Constants.paddingMedium,
        //     right: Constants.paddingMedium,
        //     bottom: Constants.paddingSmall,
        //   ),
        //   child: Row(
        //     children: [
        //       Container(
        //         width: 3,
        //         height: 18,
        //         decoration: BoxDecoration(
        //           color: AppColors.kara,
        //           borderRadius: BorderRadius.circular(2),
        //         ),
        //       ),
        //       const SizedBox(width: Constants.spacingExtraSmall),
        //       Text(
        //         'VIP',
        //         style: theme.textTheme.titleMedium?.copyWith(
        //           fontWeight: FontWeight.bold,
        //           color: AppColors.kara,
        //           letterSpacing: 1,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // VIP cards row — maximum 3
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(items.length, (index) {
              final center = items[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index < items.length - 1 ? Constants.spacingSmall : 0,
                ),
                child: Stack(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        Constants.borderRadiusSmall,
                      ),
                      onTap: () {
                        context.pushNamed(
                          Routes.trainingCenterDetail.name,
                          pathParameters: {'id': center.id.toString()},
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Constants.borderRadiusSmall,
                        ),
                        child: SizedBox(
                          width: 110,
                          height: 75,
                          child: CachedNetworkImage(
                            imageUrl:
                                '${EnvConfig.baseApiUrl}${center.imageUrl}',
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
                            progressIndicatorBuilder:
                                (context, url, progress) => Container(
                                  color: isDark
                                      ? AppColors.darkBorder
                                      : AppColors.lightBorder,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                    // VIP badge
                    Positioned(
                      top: Constants.spacingExtraSmall,
                      left: Constants.spacingExtraSmall,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants.paddingSmall,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kara,
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusLarge,
                          ),
                        ),
                        child: const Text(
                          'VIP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: Constants.spacingMedium),
      ],
    );
  }
}
