import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_category_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_section_with_floating_button.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicantsScreen extends StatefulWidget {
  const JobApplicantsScreen({super.key});

  @override
  State<JobApplicantsScreen> createState() => _JobApplicantsScreenState();
}

class _JobApplicantsScreenState extends State<JobApplicantsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return JobSectionWithFloatingButton(
      child: const JobCategorySection(
        key: PageStorageKey<String>('job_applicants'),
        categoryName: 'Job applicants',
        itemCount: 8,
        showHeader: false,
      ),
      onPressed: () {
        context.goNamed(Routes.postJobApplicant.name);
      },
    );
  }
}
