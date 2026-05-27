import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/kara_history_dismissible.dart';
import 'package:kianja/features/account/presentation/widgets/wallet_balance_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>()
        ..add(
          const AccountWalletHistoryRequested(
            queryPageParams: QueryPageParams(page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Kara'),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountRequestInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountRequestFailure) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<AccountBloc>(context).add(
                    const AccountWalletHistoryRequested(
                      queryPageParams: QueryPageParams(page: 1),
                    ),
                  );
                },
                message: state.message,
              );
            } else if (state is AccountWalletHistorySuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                      horizontal: Constants.paddingMedium,
                    ),
                    child: WalletBalanceCard(
                      balance: '100000',
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    indent: Constants.paddingMedium,
                    endIndent: Constants.paddingMedium,
                  ),
                  Expanded(
                    child: state.history.isEmpty
                        ? const Center(child: Text('No Kara history yet'))
                        : ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: state.history.length,
                            itemBuilder: (context, index) {
                              return KaraHistoryDismissible(
                                history: state.history[index],
                                onDeleteConfirmed: () {},
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                indent: Constants.paddingMedium,
                                endIndent: Constants.paddingMedium,
                              );
                            },
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
