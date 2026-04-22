import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/job_item_card.dart';
import 'package:kianja/routing/routes.dart';

class JobCategoryViewAllScreen extends StatelessWidget {
  const JobCategoryViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const TitleHeader(title: 'Jobs'),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingMedium),
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.goNamed(Routes.jobOfferDetail.name);
                  },
                  child: const JobItemCard(),
                );
              },
            ),
            const SizedBox(height: Constants.spacingMedium),
          ],
        ),
      ),
    );
  }
}
