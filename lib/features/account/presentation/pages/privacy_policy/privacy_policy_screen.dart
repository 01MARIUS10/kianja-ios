import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<AccountBloc>()..add(const AccountPrivacyRequested()),
      child: Scaffold(
        appBar: const TitleHeader(title: 'Privacy Policy'),
        body: SafeArea(
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountRequestInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AccountRequestFailure) {
                return ServerFailureScreen(
                  onRetry: () {
                    BlocProvider.of<AccountBloc>(
                      context,
                    ).add(const AccountPrivacyRequested());
                  },
                  message: state.message,
                );
              } else if (state is AccountPrivacySuccess) {
                AppDebug.showPrint('privacy: ${state.privacy}');
                final WebViewController webViewController = WebViewController()
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onNavigationRequest: (request) async {
                        final uri = Uri.parse(request.url);
                        if (['tel', 'mailto', 'sms'].contains(uri.scheme)) {
                          await launchUrl(uri); // package url_launcher
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadHtmlString(
                    state.privacy,
                    baseUrl: 'https://kianja.mips.mg/privacy',
                  );
                return Column(
                  children: [
                    Expanded(
                      child: WebViewWidget(controller: webViewController),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
