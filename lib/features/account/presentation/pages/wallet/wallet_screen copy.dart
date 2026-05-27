import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/kara_history_dismissible.dart';
import 'package:kianja/features/account/presentation/widgets/wallet_balance_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  static const String _staticBalance = '100 000';

  final ScrollController _scrollController = ScrollController();

  List<KaraHistory> _history = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  Completer<void>? _refreshCompleter;

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

    final state = BlocProvider.of<AccountBloc>(context).state;
    if (state is AccountWalletHistorySuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<AccountBloc>(
        context,
      ).add(const AccountWalletLoadMoreRequested());
    }
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<AccountBloc>(context).add(
      const AccountWalletHistoryRequested(
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
      create: (_) => GetIt.instance<AccountBloc>()
        ..add(
          const AccountWalletHistoryRequested(
            queryPageParams: QueryPageParams(page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Kara'),
        child: BlocConsumer<AccountBloc, AccountState>(
          listenWhen: (previous, current) =>
              current is AccountWalletHistorySuccess ||
              current is AccountRequestFailure,
          listener: (context, state) {
            if (state is AccountWalletHistorySuccess) {
              setState(() {
                _history = state.history;
                _hasLoadedOnce = true;
                _errorMessage = null;
              });
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            } else if (state is AccountRequestFailure) {
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
            if (current is AccountRequestInProgress && _hasLoadedOnce) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (!_hasLoadedOnce && state is AccountRequestInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!_hasLoadedOnce && _errorMessage != null) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<AccountBloc>(context).add(
                    const AccountWalletHistoryRequested(
                      queryPageParams: QueryPageParams(page: 1),
                    ),
                  );
                },
                message: _errorMessage!,
              );
            }

            if (_hasLoadedOnce) {
              final history = state is AccountWalletHistorySuccess
                  ? state.history
                  : _history;
              final hasMore =
                  state is AccountWalletHistorySuccess && state.hasMore;
              final itemCount =
                  hasMore ? history.length + 1 : history.length;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Constants.paddingMedium,
                      Constants.paddingMedium,
                      Constants.paddingMedium,
                      Constants.paddingSmall,
                    ),
                    child: WalletBalanceCard(
                      balance: _staticBalance,
                      onTransfer: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.paddingMedium,
                      vertical: Constants.paddingSmall,
                    ),
                    child: Text(
                      'Kara usage history',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: history.isEmpty
                        ? RefreshIndicator.adaptive(
                            displacement: 10,
                            onRefresh: _refresh,
                            child: ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: const [
                                SizedBox(height: 120),
                                Center(child: Text('No Kara history yet')),
                              ],
                            ),
                          )
                        : RefreshIndicator.adaptive(
                            displacement: 10,
                            onRefresh: _refresh,
                            child: ListView.separated(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(
                                bottom: Constants.paddingMedium,
                              ),
                              itemCount: itemCount,
                              itemBuilder: (context, index) {
                                if (hasMore && index >= history.length) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Constants.paddingMedium,
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                }

                                return KaraHistoryDismissible(
                                  history: history[index],
                                  onDeleteConfirmed: () {},
                                );
                              },
                              separatorBuilder: (context, index) {
                                if (hasMore && index >= history.length - 1) {
                                  return const SizedBox.shrink();
                                }
                                return const Divider(height: 1);
                              },
                            ),
                          ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
