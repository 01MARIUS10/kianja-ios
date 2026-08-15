import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/candidate/candidate_item_list.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';
import 'package:kianja/routing/routes.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({super.key, required this.jobOfferId});
  final int jobOfferId;

  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  final ScrollController _scrollController = ScrollController();

  List<User> _candidates = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  Completer<void>? _refreshCompleter;
  MyPostBloc? _myPostBloc;

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

    final bloc = _myPostBloc;
    if (bloc == null) return;

    final state = bloc.state;
    if (state is MyPostGetCandidatesSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      bloc.add(
        MyPostLoadMoreCandidatesRequested(
          getCandidatesParams: GetCandidatesParams(
            jobId: widget.jobOfferId,
            page: 1,
          ),
        ),
      );
    }
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    final bloc = _myPostBloc;
    if (bloc == null) return _refreshCompleter?.future ?? Future.value();

    _refreshCompleter = Completer<void>();
    bloc.add(
      MyPostGetAllCandidatesRequested(
        getCandidatesParams: GetCandidatesParams(
          jobId: widget.jobOfferId,
          page: 1,
        ),
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
        _myPostBloc = GetIt.instance<MyPostBloc>()
          ..add(
            MyPostGetAllCandidatesRequested(
              getCandidatesParams: GetCandidatesParams(
                jobId: widget.jobOfferId,
                page: 1,
              ),
            ),
          );
        return _myPostBloc!;
      },
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Liste des candidats'),
        child: BlocConsumer<MyPostBloc, MyPostState>(
          listenWhen: (previous, current) =>
              current is MyPostGetCandidatesSuccess ||
              current is MyPostRequestFailure,
          listener: (context, state) {
            if (state is MyPostGetCandidatesSuccess) {
              setState(() {
                _candidates = state.users;
                _hasLoadedOnce = true;
                _errorMessage = null;
              });
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            } else if (state is MyPostRequestFailure) {
              if (!_hasLoadedOnce) {
                setState(() => _errorMessage = state.message);
              } else {
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
                    MyPostGetAllCandidatesRequested(
                      getCandidatesParams: GetCandidatesParams(
                        jobId: widget.jobOfferId,
                        page: 1,
                      ),
                    ),
                  );
                },
                message: _errorMessage!,
              );
            }

            if (_hasLoadedOnce) {
              if (_candidates.isEmpty) {
                return Center(
                  child: Text(context.appLoc.no_job_applicants_yet),
                );
              }

              final hasMore =
                  state is MyPostGetCandidatesSuccess && state.hasMore;
              final itemCount = hasMore
                  ? _candidates.length + 1
                  : _candidates.length;

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
                    if (hasMore && index >= _candidates.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Constants.paddingMedium,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }

                    final candidate = _candidates[index];
                    return InkWell(
                      onTap: () {
                        context.goNamed(
                          Routes.candidateDetail.name,
                          pathParameters: {
                            'jobId': '${widget.jobOfferId}',
                            'id': '${candidate.id}',
                          },
                        );
                      },
                      child: CandidateItemList(user: candidate),
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
