import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<AccountBloc>()..add(const AccountCguRequested()),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Terms of Use'),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountRequestInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountRequestFailure) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<AccountBloc>(
                    context,
                  ).add(const AccountCguRequested());
                },
                message: state.message,
              );
            } else if (state is AccountCguSuccess) {
              final WebViewController webViewController = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadHtmlString(state.cgu);
              return WebViewWidget(controller: webViewController);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
