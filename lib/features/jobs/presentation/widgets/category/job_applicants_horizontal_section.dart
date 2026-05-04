import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/padding_separator.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/job_applicant_card.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicantsHorizontalSection extends StatelessWidget {
  const JobApplicantsHorizontalSection({
    super.key,
    required this.category,
    required this.query,
    required this.jobApplicants,
  });
  final String category;
  final String query;
  final List<JobApplicant> jobApplicants;

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
                    Routes.jobApplicantViewAll.name,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(jobApplicants.length, (index) {
              return PaddingSeparator(
                index: index,
                itemCount: jobApplicants.length,
                child: InkWell(
                  onTap: () {
                    context.goNamed(
                      Routes.jobApplicantDetail.name,
                      pathParameters: {
                        'id': jobApplicants[index].id.toString(),
                      },
                    );
                  },
                  child: JobApplicantCard(jobApplicant: jobApplicants[index]),
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
