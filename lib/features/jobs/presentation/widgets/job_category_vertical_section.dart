import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_horizontal_card_widget.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_item_card.dart';
import 'package:kianja/routing/router.dart';
import 'package:kianja/routing/routes.dart';

class JobCategoryVerticalSection extends StatelessWidget {
  const JobCategoryVerticalSection({
    super.key,
    required this.category,
    required this.itemCount,
  });
  final String category;
  final int itemCount;

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
              //   if (itemCount > 0)
              //     InkWell(
              //       child: Text(
              //         'Voir plus',
              //         style: theme.textTheme.bodyMedium?.copyWith(
              //           color: isDark
              //               ? AppColors.darkTextSecondary
              //               : AppColors.lightTextSecondary,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Constants.spacingSmall,
            mainAxisSpacing: Constants.spacingMedium,
            childAspectRatio: 0.74,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.goNamed(Routes.jobOfferDetail.name);
              },
              child: const JobHorizontalCardWidget(),
            );
          },
        ),
        const SizedBox(height: Constants.spacingMedium),
      ],
    );
  }
}
