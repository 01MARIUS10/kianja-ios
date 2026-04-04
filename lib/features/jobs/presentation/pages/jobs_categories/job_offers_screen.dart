import 'package:flutter/material.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_categories/job_offer_category_screen.dart';

class JobOffersScreen extends StatefulWidget {
  const JobOffersScreen({super.key});

  @override
  State<JobOffersScreen> createState() => _JobOffersScreenState();
}

class _JobOffersScreenState extends State<JobOffersScreen>
    with TickerProviderStateMixin {
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
    return Column(
      children: [
        TabBar.secondary(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: 'Enterprises'),
            Tab(text: 'Particular'),
            Tab(text: 'Public organizations'),
            Tab(text: 'ONG'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              JobOfferCategoryScreen(category: 'Enterprises', itemCount: 15),
              JobOfferCategoryScreen(category: 'Particular', itemCount: 25),
              JobOfferCategoryScreen(
                category: 'Public organizations',
                itemCount: 5,
              ),
              JobOfferCategoryScreen(category: 'ONG', itemCount: 7),
            ],
          ),
        ),
      ],
    );
  }
}
