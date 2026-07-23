import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';

class SaveHotEventItemList extends StatelessWidget {
  const SaveHotEventItemList({
    super.key,
    required this.hotEvent,
    this.onTap,
  });

  final HotEvent hotEvent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final imageUrl = hotEvent.image?.url ?? hotEvent.imageUrl;

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
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: SizedBox(
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: '${EnvConfig.baseApiUrl}$imageUrl',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    hotEvent.type == 'hot' ? Assets.hot : Assets.events,
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
                          hotEvent.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (hotEvent.center.name.isNotEmpty)
                          Row(
                            children: [
                              Icon(
                                Icons.school_outlined,
                                size: Constants.iconSizeExtraSmall,
                                color: textSecondary,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  hotEvent.center.name,
                                  style: theme.textTheme.bodySmall?.copyWith(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: Constants.iconSizeExtraSmall,
                          color: textSecondary,
                        ),
                        const SizedBox(width: Constants.spacingExtraSmall),
                        Expanded(
                          child: Text(
                            '${context.appLoc.start}: ${AppFunction.getDate(hotEvent.startDate)}',
                            style: theme.textTheme.bodySmall?.copyWith(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
