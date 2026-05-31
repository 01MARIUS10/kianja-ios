import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/padding_separator.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/hot_event_card.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterHorizontalSection extends StatelessWidget {
  const TrainingCenterHorizontalSection({
    super.key,
    required this.domain,
    required this.query,
    required this.hotEvents,
  });
  final String domain;
  final String query;
  final List<HotEvent> hotEvents;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.paddingMedium,
            right: Constants.paddingMedium,
            bottom: Constants.paddingSmall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                domain,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    context.goNamed(
                      Routes.trainingCenterHotEventViewAll.name,
                      extra: {'title': domain, 'query': query},
                    );
                  },
                  child: Text(
                    context.appLoc.view_more,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(hotEvents.length, (index) {
              return PaddingSeparator(
                index: index,
                itemCount: hotEvents.length,
                child: InkWell(
                  onTap: () {
                    context.goNamed(
                      Routes.trainingCenterHotEventDetail.name,
                      pathParameters: {'id': hotEvents[index].id.toString()},
                      extra: {'domain': domain, 'query': query},
                    );
                  },
                  child: HotEventCard(
                    hotEvent: hotEvents[index],
                    widthViewEnum: WidthViewEnum.list,
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
