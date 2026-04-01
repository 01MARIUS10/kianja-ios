import 'package:flutter/material.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_category_section.dart';

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
    return const SingleChildScrollView(
      key: PageStorageKey<String>('job_offers'),
      child: JobCategorySection(
        categoryName: 'Job offers',
        itemCount: 50,
        showHeader: false,
      ),
    );
  }
}
