import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAddScreen extends StatelessWidget {
  const ViewAddScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
