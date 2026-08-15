import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/job_offer_card.dart';
import 'package:kianja/routing/routes.dart';

class JobCategoryViewAllScreen extends StatelessWidget {
  const JobCategoryViewAllScreen({
    super.key,
    required this.title,
    required this.query,
  });
  final String title;
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          JobsViewAllFetchRequested(
            queryPageParams: QueryPageParams(query: query, page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: title),
        child: _JobCategoryViewAllContent(query: query),
      ),
    );
  }
}

class _JobCategoryViewAllContent extends StatefulWidget {
  const _JobCategoryViewAllContent({required this.query});
  final String query;

  @override
  State<_JobCategoryViewAllContent> createState() =>
      _JobCategoryViewAllContentState();
}

class _JobCategoryViewAllContentState
    extends State<_JobCategoryViewAllContent> {
  final ScrollController _scrollController = ScrollController();

  List<JobOffer> _jobOffers = [];
  bool _hasLoadedOnce = false;
  bool _hasMore = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.maxScrollExtent - position.pixels > 300) return;

    final state = BlocProvider.of<JobsBloc>(context).state;
    if (state is JobsViewAllFetchSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<JobsBloc>(
        context,
      ).add(const JobsLoadMoreViewAllRequested());
    }
  }

  void _fetchFirstPage() {
    BlocProvider.of<JobsBloc>(context).add(
      JobsViewAllFetchRequested(
        queryPageParams: QueryPageParams(query: widget.query, page: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsBloc, JobsState>(
      listenWhen: (previous, current) =>
          current is JobsViewAllFetchSuccess || current is JobsRequestFailure,
      listener: (context, state) {
        if (state is JobsViewAllFetchSuccess) {
          setState(() {
            _jobOffers = state.jobOffers;
            _hasMore = state.hasMore;
            _hasLoadedOnce = true;
            _errorMessage = null;
          });
        } else if (state is JobsRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() => _errorMessage = state.message);
          } else {
            AppMessenger.showError(context, state.message);
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is JobsRequestInProgress && _hasLoadedOnce) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (!_hasLoadedOnce && state is JobsRequestInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_hasLoadedOnce && _errorMessage != null) {
          if (_errorMessage!.contains('connection')) {
            return NoConnectionScreen(onRetry: _fetchFirstPage);
          }
          return ServerFailureScreen(
            onRetry: _fetchFirstPage,
            message: _errorMessage!,
          );
        }

        if (_hasLoadedOnce) {
          return CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: Constants.paddingMedium,
                  horizontal: Constants.paddingMedium,
                ),
                sliver: SliverAlignedGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: Constants.spacingSmall,
                  mainAxisSpacing: Constants.spacingMedium,
                  itemCount: _jobOffers.length,
                  itemBuilder: (context, index) {
                    final jobOffer = _jobOffers[index];
                    return Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                            Routes.jobOfferDetail.name,
                            pathParameters: {
                              'id': jobOffer.id.toString(),
                              'matchedLocation': GoRouterState.of(
                                context,
                              ).matchedLocation,
                            },
                          );
                        },
                        child: JobOfferCard(
                          jobOffer: jobOffer,
                          widthViewEnum: WidthViewEnum.grid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_hasMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
