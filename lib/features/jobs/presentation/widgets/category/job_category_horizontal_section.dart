import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/job_offer_card.dart';
import 'package:kianja/routing/routes.dart';

class JobCategoryHorizontalSection extends StatelessWidget {
  const JobCategoryHorizontalSection({
    super.key,
    required this.category,
    required this.query,
    required this.jobOfferList,
  });
  final String category;
  final String query;
  final List<JobOffer> jobOfferList;

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
              TextButton(
                onPressed: () {
                  context.goNamed(
                    Routes.jobCategoryViewAll.name,
                    extra: {'title': category, 'query': query},
                  );
                },
                child: Text(
                  'Voir plus',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 218,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingMedium,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: jobOfferList.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: Constants.spacingSmall),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.goNamed(
                    Routes.jobOfferDetail.name,
                    pathParameters: {'id': jobOfferList[index].id.toString()},
                  );
                },
                child: JobOfferCard(jobOffer: jobOfferList[index]),
              );
            },
          ),
        ),
        const SizedBox(height: Constants.spacingMedium),
      ],
    );
  }
}
