import 'package:flutter/material.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_category_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_section_with_floating_button.dart';

class JobOfferCategoryScreen extends StatefulWidget {
  const JobOfferCategoryScreen({
    super.key,
    required this.category,
    required this.itemCount,
  });
  final String category;
  final int itemCount;

  @override
  State<JobOfferCategoryScreen> createState() => _JobOfferCategoryScreenState();
}

class _JobOfferCategoryScreenState extends State<JobOfferCategoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return JobSectionWithFloatingButton(
      child: JobCategorySection(
        key: PageStorageKey<String>(widget.category),
        categoryName: widget.category,
        itemCount: widget.itemCount,
        showHeader: false,
      ),
      onPressed: () {},
    );
  }
}
