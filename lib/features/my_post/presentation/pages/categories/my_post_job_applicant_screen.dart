import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_job_applicant_dismissible.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';
import 'package:kianja/routing/routes.dart';

class MyPostJobApplicantScreen extends StatefulWidget {
  const MyPostJobApplicantScreen({super.key});

  @override
  State<MyPostJobApplicantScreen> createState() =>
      _MyPostJobApplicantScreenState();
}

class _MyPostJobApplicantScreenState extends State<MyPostJobApplicantScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  List<JobApplicant> _jobApplicants = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  int? _processingJobApplicantId;
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
    if (state is MyPostGetAllJobApplicantsSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<MyPostBloc>(
        context,
      ).add(const MyPostLoadMoreJobApplicantsRequested());
    }
  }

  void _onTap(JobApplicant jobApplicant) {
    context.pushNamed(
      Routes.jobApplicantDetail.name,
      pathParameters: {'id': jobApplicant.id.toString()},
    );
  }

  void _onDelete(JobApplicant jobApplicant) {
    setState(() => _processingJobApplicantId = jobApplicant.id);
    BlocProvider.of<MyPostBloc>(context).add(
      MyPostDeleteJobApplicantRequested(
        deleteJobApplicantParams: DeleteJobApplicantParams(id: jobApplicant.id),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<MyPostBloc>(context).add(
      const MyPostGetAllJobApplicantsRequested(
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
          current is MyPostGetAllJobApplicantsSuccess ||
          current is MyPostDeleteJobApplicantSuccess ||
          current is MyPostRequestFailure,
      listener: (context, state) {
        if (state is MyPostGetAllJobApplicantsSuccess) {
          setState(() {
            _jobApplicants = state.jobApplicants;
            _hasLoadedOnce = true;
            _errorMessage = null;
            _processingJobApplicantId = null;
          });
          if (_refreshCompleter != null) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
          }
        } else if (state is MyPostDeleteJobApplicantSuccess) {
          BlocProvider.of<MyPostBloc>(context).add(
            const MyPostGetAllJobApplicantsRequested(
              queryPageParams: QueryPageParams(page: 1),
            ),
          );
        } else if (state is MyPostRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() {
              _errorMessage = state.message;
              _processingJobApplicantId = null;
            });
          } else {
            setState(() => _processingJobApplicantId = null);
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
                const MyPostGetAllJobApplicantsRequested(
                  queryPageParams: QueryPageParams(page: 1),
                ),
              );
            },
            message: _errorMessage!,
          );
        }

        if (_hasLoadedOnce) {
          if (_jobApplicants.isEmpty) {
            return const Center(child: Text('No job applicants yet'));
          }

          final hasMore =
              state is MyPostGetAllJobApplicantsSuccess && state.hasMore;

          final itemCount =
              hasMore ? _jobApplicants.length + 1 : _jobApplicants.length;

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
                if (hasMore && index >= _jobApplicants.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }

                final jobApplicant = _jobApplicants[index];
                return InkWell(
                  onTap: () => _onTap(jobApplicant),
                  child: MyPostJobApplicantDismissible(
                    jobApplicant: jobApplicant,
                    isProcessing:
                        _processingJobApplicantId == jobApplicant.id,
                    onDeleteConfirmed: () => _onDelete(jobApplicant),
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


