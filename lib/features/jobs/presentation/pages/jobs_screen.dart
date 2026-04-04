import 'package:flutter/material.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_categories/experts_executives_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_categories/job_applicants_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_categories/job_offers_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_categories/training_center_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/jobs_header.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;
    return BaseScreen(
      appBar: JobsHeader(title: EnvConfig.appName),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(text: 'Job offers'),
              Tab(text: 'Job applicants'),
              Tab(text: 'Training center'),
              Tab(text: 'Experts & executes'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                JobOffersScreen(),
                JobApplicantsScreen(),
                TrainingCenterScreen(),
                ExpertExecutiveScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
