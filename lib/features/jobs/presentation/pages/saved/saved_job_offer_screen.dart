import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_list/saved_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/save_content_dimissible.dart';
import 'package:kianja/routing/routes.dart';

class SavedJobOfferScreen extends StatefulWidget {
  const SavedJobOfferScreen({super.key});

  @override
  State<SavedJobOfferScreen> createState() => _SavedJobOfferScreenState();
}

class _SavedJobOfferScreenState extends State<SavedJobOfferScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  List<JobOffer> _jobOffers = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  int? _processingJobOfferId;
  Completer<void>? _refreshCompleter;

  @override
  bool get wantKeepAlive => true;

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

    final state = BlocProvider.of<SavedListBloc>(context).state;
    if (state is SavedListLoadJobOffersSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<SavedListBloc>(
        context,
      ).add(const SavedListLoadMoreJobOffers());
    }
  }

  void _onTap(JobOffer jobOffer) {
    context.pushNamed(
      Routes.jobOfferDetail.name,
      pathParameters: {
        'id': jobOffer.id.toString(),
        'matchedLocation': GoRouterState.of(context).matchedLocation,
      },
    );
  }

  void _onUnsaved(JobOffer jobOffer) {
    setState(() => _processingJobOfferId = jobOffer.id);
    BlocProvider.of<SaveContentBloc>(context).add(
      SaveContentSaved(
        saveContentParams: SaveContentParams(
          saveContent: SaveContentEnum.jobOffers,
          id: jobOffer.id,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<SavedListBloc>(context).add(
      const SavedListJobOffersLoaded(queryPageParams: QueryPageParams(page: 1)),
    );
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return _refreshCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<SaveContentBloc, SaveContentState>(
      listenWhen: (previous, current) => current is SaveContentSuccess,
      listener: (context, state) {
        if (state is SaveContentSuccess) {
          setState(() {
            _jobOffers.removeWhere((e) => e.id == state.id);
            _processingJobOfferId = null;
          });
          AppMessenger.showSuccess(context, state.message);
        }
      },
      child: BlocConsumer<SavedListBloc, SavedListState>(
        listenWhen: (previous, current) =>
            current is SavedListLoadJobOffersSuccess ||
            current is SavedListLoadJobOffersFailure,
        listener: (context, state) {
          if (state is SavedListLoadJobOffersSuccess) {
            setState(() {
              _jobOffers = state.jobOffers;
              _hasLoadedOnce = true;
              _errorMessage = null;
              _processingJobOfferId = null;
            });
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          } else if (state is SavedListLoadJobOffersFailure) {
            if (!_hasLoadedOnce) {
              setState(() {
                _errorMessage = state.error;
                _processingJobOfferId = null;
              });
            } else {
              setState(() => _processingJobOfferId = null);
              AppMessenger.showError(context, state.error);
            }
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is SavedListLoadJobOffersInProgress && _hasLoadedOnce) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (!_hasLoadedOnce && state is SavedListLoadJobOffersInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!_hasLoadedOnce && _errorMessage != null) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<SavedListBloc>(context).add(
                  const SavedListJobOffersLoaded(
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
                state is SavedListLoadJobOffersSuccess && state.hasMore;

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
                  return InkWell(
                    onTap: () => _onTap(jobOffer),
                    child: SaveContentDimissible(
                      jobOffer: jobOffer,
                      isProcessing: _processingJobOfferId == jobOffer.id,
                      onUnsavedConfirm: () => _onUnsaved(jobOffer),
                    ),
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
    );
  }
}
