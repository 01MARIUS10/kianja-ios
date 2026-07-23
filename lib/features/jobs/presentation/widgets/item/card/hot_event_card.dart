import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';

class HotEventCard extends StatelessWidget {
  const HotEventCard({
    super.key,
    required this.hotEvent,
    required this.widthViewEnum,
  });
  final HotEvent hotEvent;
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
            height: Constants.size100,
            width: double.infinity,
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            child: CachedNetworkImage(
              imageUrl: '${EnvConfig.baseApiUrl}${hotEvent.image?.url}',
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Image.asset(
                  hotEvent.type == 'hot' ? Assets.hot : Assets.events,
                  fit: BoxFit.fill,
                  errorBuilder: (context, url, error) => hotEvent.type == 'hot'
                      ? Image.asset(Assets.hot, fit: BoxFit.fill)
                      : Image.asset(Assets.events, fit: BoxFit.fill),
                );
              },
              progressIndicatorBuilder: (context, url, progress) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(Constants.paddingSmall),
            child: Text(
              hotEvent.title,
              style: theme.textTheme.titleSmall,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
