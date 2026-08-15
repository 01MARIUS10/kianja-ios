import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/presentation/bloc/job_applications/job_applications_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/list/job_applications_item_list.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicationsScreen extends StatefulWidget {
  const JobApplicationsScreen({super.key});

  @override
  State<JobApplicationsScreen> createState() => _JobApplicationsScreenState();
}

class _JobApplicationsScreenState extends State<JobApplicationsScreen> {
  final ScrollController _scrollController = ScrollController();

  List<JobOffer> _jobOffers = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  Completer<void>? _refreshCompleter;
  JobApplicationsBloc? _jobApplicationsBloc;

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

    final bloc = _jobApplicationsBloc;
    if (bloc == null) return;

    final state = bloc.state;
    if (state is JobApplicationsLoadJobOffersSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      bloc.add(const JobApplicationsLoadMoreJobOffers());
    }
  }

  void _onTap(JobOffer jobOffer) {
    final appRouteState = GoRouterState.of(context);
    context.pushNamed(
      Routes.jobOfferDetail.name,
      pathParameters: {
        'id': jobOffer.id.toString(),
        'matchedLocation': appRouteState.matchedLocation,
      },
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    final bloc = _jobApplicationsBloc;
    if (bloc == null) return _refreshCompleter?.future ?? Future.value();

    _refreshCompleter = Completer<void>();
    bloc.add(
      const JobApplicationsJobOffersLoaded(
        queryPageParams: QueryPageParams(page: 1),
      ),
    );
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return _refreshCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        _jobApplicationsBloc = GetIt.instance<JobApplicationsBloc>()
          ..add(
            const JobApplicationsJobOffersLoaded(
              queryPageParams: QueryPageParams(page: 1),
            ),
          );
        return _jobApplicationsBloc!;
      },
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.my_applications),
        child: BlocConsumer<JobApplicationsBloc, JobApplicationsState>(
          listenWhen: (previous, current) =>
              current is JobApplicationsLoadJobOffersSuccess ||
              current is JobApplicationsLoadJobOffersFailure,
          listener: (context, state) {
            if (state is JobApplicationsLoadJobOffersSuccess) {
              setState(() {
                _jobOffers = state.jobOffers;
                _hasLoadedOnce = true;
                _errorMessage = null;
              });
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            } else if (state is JobApplicationsLoadJobOffersFailure) {
              if (!_hasLoadedOnce) {
                setState(() => _errorMessage = state.error);
              } else {
                AppMessenger.showError(context, state.error);
              }
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            }
          },
          buildWhen: (previous, current) {
            if (current is JobApplicationsLoadJobOffersInProgress &&
                _hasLoadedOnce) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (!_hasLoadedOnce &&
                state is JobApplicationsLoadJobOffersInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!_hasLoadedOnce && _errorMessage != null) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<JobApplicationsBloc>(context).add(
                    const JobApplicationsJobOffersLoaded(
                      queryPageParams: QueryPageParams(page: 1),
                    ),
                  );
                },
                message: _errorMessage!,
              );
            }

            if (_hasLoadedOnce) {
              if (_jobOffers.isEmpty) {
                return Center(child: Text(context.appLoc.no_job_offers_yet));
              }

              final hasMore =
                  state is JobApplicationsLoadJobOffersSuccess && state.hasMore;
              final itemCount = hasMore
                  ? _jobOffers.length + 1
                  : _jobOffers.length;

              return RefreshIndicator.adaptive(
                displacement: 10,
                onRefresh: _refresh,
                child: ListView.separated(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.paddingSmall,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (hasMore && index >= _jobOffers.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Constants.paddingMedium,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }

                    final jobOffer = _jobOffers[index];
                    return JobApplicationsItemList(
                      jobOffer: jobOffer,
                      onTap: () => _onTap(jobOffer),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: Constants.spacingExtraSmall);
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
