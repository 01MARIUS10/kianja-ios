import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/routing/routes.dart';

/// Displays up to 3 [TrainingCenter] vipCenters as VIP cards in a horizontal row.
class TrainingCenterVipSection extends StatelessWidget {
  const TrainingCenterVipSection({super.key, required this.vipCenters});
  final List<TrainingCenter> vipCenters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final centers = vipCenters.toList();
    final imageWidth =
        MediaQuery.of(context).size.width / 3 - Constants.paddingLarge * 2 / 3;
    // centers.add(centers.first);
    // centers.add(centers.first);

    if (centers.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(centers.length, (index) {
              final center = centers[index];
              return Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: imageWidth,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusSmall,
                          ),
                          onTap: () {
                            context.pushNamed(
                              Routes.trainingCenterDetail.name,
                              pathParameters: {
                                'trainingCenterId': center.id.toString(),
                              },
                            );
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Constants.borderRadiusSmall,
                                ),
                                child: CachedNetworkImage(
                                  width: imageWidth,
                                  height: 100,
                                  imageUrl:
                                      '${EnvConfig.baseApiUrl}${center.images?.first.url}',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
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
                              const SizedBox(
                                height: Constants.paddingExtraSmall,
                              ),
                              Text(
                                center.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
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
                  ),
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
