import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/training_center_card.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterVerticalSection extends StatelessWidget {
  const TrainingCenterVerticalSection({
    super.key,
    required this.category,
    required this.query,
    required this.trainingCenters,
  });
  final String category;
  final String query;
  final List<TrainingCenter> trainingCenters;

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
                category,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          crossAxisCount: 2,
          crossAxisSpacing: Constants.spacingSmall,
          mainAxisSpacing: Constants.spacingMedium,
          itemCount: trainingCenters.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  context.goNamed(
                    Routes.trainingCenterDetail.name,
                    pathParameters: {
                      'trainingCenterId': trainingCenters[index].id.toString(),
                    },
                  );
                },
                child: TrainingCenterCard(
                  trainingCenter: trainingCenters[index],
                  widthViewEnum: WidthViewEnum.grid,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: Constants.spacingSmall),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                isDark ? AppColors.darkSurface : AppColors.lightSurface,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadiusMedium,
                  ),
                  side: BorderSide(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ),
              ),
            ),
            onPressed: () {
              context.goNamed(
                Routes.trainingCenterViewAll.name,
                extra: {'title': category, 'query': query},
              );
            },
            child: Text(
              'Voir plus',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: Constants.spacingMedium),
      ],
    );
  }
}
