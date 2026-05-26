import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_job_offer_dismissible.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';
import 'package:kianja/routing/routes.dart';

class MyPostJobOfferScreen extends StatefulWidget {
  const MyPostJobOfferScreen({super.key});

  @override
  State<MyPostJobOfferScreen> createState() => _MyPostJobOfferScreenState();
}

class _MyPostJobOfferScreenState extends State<MyPostJobOfferScreen>
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

    final state = BlocProvider.of<MyPostBloc>(context).state;
    if (state is MyPostGetAllJobOffersSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<MyPostBloc>(
        context,
      ).add(const MyPostLoadMoreJobOffersRequested());
    }
  }

  void _onTap(JobOffer jobOffer) {
    context.pushNamed(
      Routes.jobOfferDetail.name,
      pathParameters: {'id': jobOffer.id.toString()},
    );
  }

  Future<void> _onEdit(JobOffer jobOffer) async {
    final updated = await context.pushNamed<bool>(
      Routes.myPostJobOfferEdit.name,
      pathParameters: {'id': jobOffer.id.toString()},
      extra: jobOffer,
    );
    if (updated == true && mounted) {
      BlocProvider.of<MyPostBloc>(context).add(
        const MyPostGetAllJobOffersRequested(
          queryPageParams: QueryPageParams(page: 1),
        ),
      );
    }
  }

  void _onDelete(JobOffer jobOffer) {
    setState(() => _processingJobOfferId = jobOffer.id);
    BlocProvider.of<MyPostBloc>(context).add(
      MyPostDeleteJobOfferRequested(
        deleteJobOfferParams: DeleteJobOfferParams(id: jobOffer.id),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<MyPostBloc>(context).add(
      const MyPostGetAllJobOffersRequested(
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
    super.build(context);

    return BlocConsumer<MyPostBloc, MyPostState>(
      listenWhen: (previous, current) =>
          current is MyPostGetAllJobOffersSuccess ||
          current is MyPostDeleteJobOfferSuccess ||
          current is MyPostRequestFailure,
      listener: (context, state) {
        if (state is MyPostGetAllJobOffersSuccess) {
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
        } else if (state is MyPostDeleteJobOfferSuccess) {
          BlocProvider.of<MyPostBloc>(context).add(
            const MyPostGetAllJobOffersRequested(
              queryPageParams: QueryPageParams(page: 1),
            ),
          );
        } else if (state is MyPostRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() {
              _errorMessage = state.message;
              _processingJobOfferId = null;
            });
          } else {
            setState(() => _processingJobOfferId = null);
            AppMessenger.showError(context, state.message);
          }
          if (_refreshCompleter != null) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is MyPostRequestInProgress && _hasLoadedOnce) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (!_hasLoadedOnce && state is MyPostRequestInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_hasLoadedOnce && _errorMessage != null) {
          return ServerFailureScreen(
            onRetry: () {
              BlocProvider.of<MyPostBloc>(context).add(
                const MyPostGetAllJobOffersRequested(
                  queryPageParams: QueryPageParams(page: 1),
                ),
              );
            },
            message: _errorMessage!,
          );
        }

        if (_hasLoadedOnce) {
          if (_jobOffers.isEmpty) {
            return const Center(child: Text('No job offers yet'));
          }

          final hasMore =
              state is MyPostGetAllJobOffersSuccess && state.hasMore;

          final itemCount = hasMore ? _jobOffers.length + 1 : _jobOffers.length;

          return MyPostRefreshScreen(
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
                  child: MyPostJobOfferDismissible(
                    jobOffer: jobOffer,
                    isProcessing: _processingJobOfferId == jobOffer.id,
                    onEditConfirmed: () => _onEdit(jobOffer),
                    onDeleteConfirmed: () => _onDelete(jobOffer),
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
    );
  }
}
