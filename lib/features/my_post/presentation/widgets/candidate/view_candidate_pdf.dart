import 'package:flutter/material.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewCandidatePdf extends StatelessWidget {
  const ViewCandidatePdf({super.key, required this.pdfUrl});

  final String pdfUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLoc.view_pdf, textAlign: TextAlign.start),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SfPdfViewer.network(
          pdfUrl,
          canShowPaginationDialog: false,
          canShowScrollHead: false,
          canShowPageLoadingIndicator: false,
          pageSpacing: 2,
        ),
      ),
    );
  }
}
