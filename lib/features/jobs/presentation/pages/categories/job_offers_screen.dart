import 'package:flutter/material.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_category_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_section_with_floating_button.dart';

class JobOffersScreen extends StatefulWidget {
  const JobOffersScreen({super.key});

  @override
  State<JobOffersScreen> createState() => _JobOffersScreenState();
}

class _JobOffersScreenState extends State<JobOffersScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return JobSectionWithFloatingButton(
      child: const JobCategorySection(
        key: PageStorageKey<String>('job_offers'),
        categoryName: 'Job offers',
        itemCount: 50,
        showHeader: false,
      ),
      onPressed: () {},
    );
  }
}
