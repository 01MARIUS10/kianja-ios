import 'package:flutter/material.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_item_widget.dart';

class JobCategorySection extends StatelessWidget {
  const JobCategorySection({
    super.key,
    required this.categoryName,
    required this.itemCount,
    this.showHeader = true,
  });

  final String categoryName;
  final int itemCount;
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader)
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.paddingMedium,
              top: Constants.paddingMedium,
              bottom: Constants.paddingSmall,
            ),
            child: Text(
              categoryName,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            indent: Constants.paddingMedium,
            endIndent: Constants.paddingMedium,
          ),
          itemBuilder: (context, index) {
            return const JobItemWidget();
          },
        ),
        const SizedBox(height: Constants.spacingMedium),
      ],
    );
  }
}
