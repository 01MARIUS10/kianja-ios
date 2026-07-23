import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_training_centers_list/saved_training_centers_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/save_training_center_content_dismissible.dart';
import 'package:kianja/routing/routes.dart';

class SavedTrainingCenterScreen extends StatefulWidget {
  const SavedTrainingCenterScreen({super.key});

  @override
  State<SavedTrainingCenterScreen> createState() =>
      _SavedTrainingCenterScreenState();
}

class _SavedTrainingCenterScreenState extends State<SavedTrainingCenterScreen>
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

    final state = BlocProvider.of<SavedTrainingCentersListBloc>(context).state;
    if (state is SavedTrainingCentersListLoadSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<SavedTrainingCentersListBloc>(
        context,
      ).add(const SavedTrainingCentersListLoadMore());
    }
  }

  void _onTap(TrainingCenter trainingCenter) {
    context.pushNamed(
      Routes.trainingCenterDetail.name,
      pathParameters: {'trainingCenterId': trainingCenter.id.toString()},
    );
  }

  void _onUnsaved(TrainingCenter trainingCenter) {
    setState(() => _processingTrainingCenterId = trainingCenter.id);
    BlocProvider.of<SaveContentBloc>(context).add(
      SaveContentSaved(
        saveContentParams: SaveContentParams(
          saveContent: SaveContentEnum.trainingCenters,
          id: trainingCenter.id,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<SavedTrainingCentersListBloc>(context).add(
      const SavedTrainingCentersListLoaded(
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

    return BlocListener<SaveContentBloc, SaveContentState>(
      listenWhen: (previous, current) => current is SaveContentSuccess,
      listener: (context, state) {
        if (state is SaveContentSuccess) {
          setState(() {
            _trainingCenters.removeWhere((e) => e.id == state.id);
            _processingTrainingCenterId = null;
          });
          AppMessenger.showSuccess(context, state.message);
        }
      },
      child: BlocConsumer<SavedTrainingCentersListBloc,
          SavedTrainingCentersListState>(
        listenWhen: (previous, current) =>
            current is SavedTrainingCentersListLoadSuccess ||
            current is SavedTrainingCentersListLoadFailure,
        listener: (context, state) {
          if (state is SavedTrainingCentersListLoadSuccess) {
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
          } else if (state is SavedTrainingCentersListLoadFailure) {
            if (!_hasLoadedOnce) {
              setState(() {
                _errorMessage = state.error;
                _processingTrainingCenterId = null;
              });
            } else {
              setState(() => _processingTrainingCenterId = null);
              AppMessenger.showError(context, state.error);
            }
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is SavedTrainingCentersListLoadInProgress &&
              _hasLoadedOnce) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (!_hasLoadedOnce &&
              state is SavedTrainingCentersListLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!_hasLoadedOnce && _errorMessage != null) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<SavedTrainingCentersListBloc>(context).add(
                  const SavedTrainingCentersListLoaded(
                    queryPageParams: QueryPageParams(page: 1),
                  ),
                );
              },
              message: _errorMessage!,
            );
          }

          if (_hasLoadedOnce) {
            if (_trainingCenters.isEmpty) {
              return Center(
                child: Text(context.appLoc.no_training_centers_yet),
              );
            }

            final hasMore =
                state is SavedTrainingCentersListLoadSuccess && state.hasMore;
            final itemCount =
                hasMore ? _trainingCenters.length + 1 : _trainingCenters.length;

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
                  if (hasMore && index >= _trainingCenters.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Constants.paddingMedium,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }

                  final trainingCenter = _trainingCenters[index];
                  return InkWell(
                    onTap: () => _onTap(trainingCenter),
                    child: SaveTrainingCenterContentDismissible(
                      trainingCenter: trainingCenter,
                      isProcessing:
                          _processingTrainingCenterId == trainingCenter.id,
                      onUnsavedConfirm: () => _onUnsaved(trainingCenter),
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
