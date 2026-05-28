import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_training_center_dismissible.dart';
import 'package:kianja/routing/routes.dart';

class MyPostTrainingCenterScreen extends StatefulWidget {
  const MyPostTrainingCenterScreen({super.key});

  @override
  State<MyPostTrainingCenterScreen> createState() =>
      _MyPostTrainingCenterScreenState();
}

class _MyPostTrainingCenterScreenState extends State<MyPostTrainingCenterScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  List<TrainingCenter> _trainingCenters = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  int? _processingTrainingCenterId;
  Completer<void>? _refreshCompleter;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    final bloc = BlocProvider.of<MyPostBloc>(context);
    final state = bloc.state;
    if (state is MyPostGetAllTrainingCentersSuccess) {
      _trainingCenters = state.trainingCenters;
      _hasLoadedOnce = true;
    } else {
      bloc.add(
        const MyPostGetAllTrainingCentersRequested(
          queryPageParams: QueryPageParams(page: 1),
        ),
      );
    }
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
    if (state is MyPostGetAllTrainingCentersSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<MyPostBloc>(
        context,
      ).add(const MyPostLoadMoreTrainingCentersRequested());
    }
  }

  void _onTap(TrainingCenter trainingCenter) {
    context.pushNamed(
      Routes.trainingCenterDetail.name,
      pathParameters: {'trainingCenterId': trainingCenter.id.toString()},
    );
  }

  Future<void> _onEdit(TrainingCenter trainingCenter) async {
    final updatedTrainingCenter = await context.pushNamed<TrainingCenter>(
      Routes.myPostTrainingCenterEdit.name,
      pathParameters: {'id': trainingCenter.id.toString()},
      extra: trainingCenter,
    );
    if (updatedTrainingCenter == null || !mounted) return;

    setState(() {
      final index =
          _trainingCenters.indexWhere((e) => e.id == updatedTrainingCenter.id);
      if (index != -1) {
        _trainingCenters[index] = updatedTrainingCenter;
      }
    });
  }

  void _onDelete(TrainingCenter trainingCenter) {
    setState(() => _processingTrainingCenterId = trainingCenter.id);
    BlocProvider.of<MyPostBloc>(context).add(
      MyPostDeleteTrainingCenterRequested(
        deleteTrainingCenterParams: DeleteTrainingCenterParams(
          id: trainingCenter.id,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<MyPostBloc>(context).add(
      const MyPostGetAllTrainingCentersRequested(
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
          current is MyPostGetAllTrainingCentersSuccess ||
          current is MyPostDeleteTrainingCenterSuccess ||
          current is MyPostRequestFailure,
      listener: (context, state) {
        if (state is MyPostGetAllTrainingCentersSuccess) {
          setState(() {
            _trainingCenters = state.trainingCenters;
            _hasLoadedOnce = true;
            _errorMessage = null;
            _processingTrainingCenterId = null;
          });
          if (_refreshCompleter != null) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
          }
        } else if (state is MyPostDeleteTrainingCenterSuccess) {
          setState(() {
            _trainingCenters.removeWhere(
              (e) => e.id == state.deletedTrainingCenterId,
            );
            _processingTrainingCenterId = null;
          });
        } else if (state is MyPostRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() {
              _errorMessage = state.message;
              _processingTrainingCenterId = null;
            });
          } else {
            setState(() => _processingTrainingCenterId = null);
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
        final hasLoaded =
            _hasLoadedOnce || state is MyPostGetAllTrainingCentersSuccess;
        final trainingCenters = state is MyPostGetAllTrainingCentersSuccess
            ? state.trainingCenters
            : _trainingCenters;

        if (!hasLoaded && state is MyPostRequestInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!hasLoaded && _errorMessage != null) {
          return ServerFailureScreen(
            onRetry: () {
              BlocProvider.of<MyPostBloc>(context).add(
                const MyPostGetAllTrainingCentersRequested(
                  queryPageParams: QueryPageParams(page: 1),
                ),
              );
            },
            message: _errorMessage!,
          );
        }

        if (hasLoaded) {
          if (trainingCenters.isEmpty) {
            return const Center(child: Text('No training centers yet'));
          }

          final hasMore =
              state is MyPostGetAllTrainingCentersSuccess && state.hasMore;
          final itemCount = hasMore
              ? trainingCenters.length + 1
              : trainingCenters.length;

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
                if (hasMore && index >= trainingCenters.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }

                final trainingCenter = trainingCenters[index];
                return InkWell(
                  onTap: () => _onTap(trainingCenter),
                  child: MyPostTrainingCenterDismissible(
                    trainingCenter: trainingCenter,
                    isProcessing:
                        _processingTrainingCenterId == trainingCenter.id,
                    onEditConfirmed: () => _onEdit(trainingCenter),
                    onDeleteConfirmed: () => _onDelete(trainingCenter),
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
