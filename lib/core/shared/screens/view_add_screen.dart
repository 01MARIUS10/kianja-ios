import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAddScreen extends StatelessWidget {
  const ViewAddScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state.sponsPartnerStatus == AppSponsPartnerStatus.loaded) {
              AppDebug.showPrint('Token in ViewAddScreen: ${state.token}');
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
                ..loadRequest(
                  Uri.parse(url),
                  headers: {'Authorization': 'Bearer ${state.token}'},
                );
              return Column(
                children: [
                  Expanded(child: WebViewWidget(controller: webViewController)),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
