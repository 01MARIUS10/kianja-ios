import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
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
            height: 70,
            width: double.infinity,
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            child: hotEvent.type == 'hot'
                ? Image.asset(Assets.hot, fit: BoxFit.cover)
                : Image.asset(Assets.events, fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.all(Constants.paddingSmall),
            child: Text(
              hotEvent.description,
              style: theme.textTheme.bodySmall?.copyWith(height: 1.2),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
