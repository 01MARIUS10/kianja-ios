import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_offers/job_offers_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_category_vertical_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/job_offer_category_screen.dart';

class JobOffersScreen extends StatefulWidget {
  const JobOffersScreen({super.key});

  @override
  State<JobOffersScreen> createState() => _JobOffersScreenState();
}

class _JobOffersScreenState extends State<JobOffersScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorText = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Column(
      children: [
        TabBar.secondary(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          dividerHeight: 0.0,
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            return states.contains(WidgetState.focused)
                ? null
                : Colors.transparent;
          }),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          onTap: (index) {
            AppDebug.showPrint('Tab index: $index');
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.paddingMedium,
                  vertical: Constants.paddingExtraSmall,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadiusLarge,
                  ),
                  border: _selectedIndex == 0
                      ? Border.all(
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                          width: 2,
                        )
                      : Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                          width: 2,
                        ),
                ),
                child: Text(
                  'Type',
                  style: theme.textTheme.titleSmall?.copyWith(color: colorText),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.paddingMedium,

                  vertical: Constants.paddingExtraSmall,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadiusLarge,
                  ),
                  border: _selectedIndex == 1
                      ? Border.all(
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                          width: 2,
                        )
                      : Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                          width: 2,
                        ),
                ),
                child: Text(
                  'Date',
                  style: theme.textTheme.titleSmall?.copyWith(color: colorText),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.paddingMedium,

                  vertical: Constants.paddingExtraSmall,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadiusLarge,
                  ),
                  border: _selectedIndex == 2
                      ? Border.all(
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                          width: 2,
                        )
                      : Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                          width: 2,
                        ),
                ),
                child: Text(
                  'Zone',
                  style: theme.textTheme.titleSmall?.copyWith(color: colorText),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              JobOffersFilterScreen(
                children: [
                  JobOfferCategoryScreen(category: 'Entreprise', itemCount: 6),
                  JobOfferCategoryScreen(category: 'Particular', itemCount: 6),
                  JobOfferCategoryScreen(
                    category: 'Public organization',
                    itemCount: 6,
                  ),
                  JobOfferCategoryScreen(category: 'ONG', itemCount: 6),
                ],
              ),
              JobOffersFilterScreen(
                children: [
                  JobOfferCategoryScreen(category: 'Recents', itemCount: 6),
                  JobCategoryVerticalSection(
                    category: 'Limit date',
                    itemCount: 6,
                  ),
                ],
              ),
              JobOffersFilterScreen(
                children: [
                  JobOfferCategoryScreen(
                    category: 'Antananarivo',
                    itemCount: 6,
                  ),
                  JobOfferCategoryScreen(category: 'Toamasina', itemCount: 2),
                  JobOfferCategoryScreen(
                    category: 'Fianarantsoa',
                    itemCount: 1,
                  ),
                  JobOfferCategoryScreen(category: 'Mahajanga', itemCount: 3),
                  JobOfferCategoryScreen(category: 'Toliara', itemCount: 4),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
