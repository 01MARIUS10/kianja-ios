import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAddScreen extends StatelessWidget {
  const ViewAddScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.sponsPartnerStatus == AppSponsPartnerStatus.loaded) {
            AppDebug.showPrint('Token in ViewAddScreen: ${state.token}');
            final WebViewController webViewController = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(
                Uri.parse(url),
                headers: {'Authorization': 'Bearer ${state.token}'},
              );
            return WebViewWidget(controller: webViewController);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
