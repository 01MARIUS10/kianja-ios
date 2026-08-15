import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

class JobApplicationsItemList extends StatelessWidget {
  const JobApplicationsItemList({
    super.key,
    required this.jobOffer,
    this.onTap,
  });

  final JobOffer jobOffer;
  final VoidCallback? onTap;

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
            if (jobOffer.images != null && jobOffer.images!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${EnvConfig.baseApiUrl}${jobOffer.images!.first.url}',
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
            if (jobOffer.images != null && jobOffer.images!.isEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
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
                ),
              ),

            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobOffer.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (jobOffer.locations.isNotEmpty)
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
                                  jobOffer.locations
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
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingExtraSmall,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.info,
                        borderRadius: BorderRadius.circular(
                          Constants.borderRadiusSmall,
                        ),
                      ),
                      child: Text(
                        context.appLoc.you_applied_to_this_offer,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
