import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class JobApplicantViewPdfScreen extends StatelessWidget {
  const JobApplicantViewPdfScreen({super.key, required this.pdfUrl});

  final String pdfUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View PDF')),
      body: SfPdfViewer.network(
        pdfUrl,
        canShowPaginationDialog: false,
        canShowScrollHead: false,
        canShowPageLoadingIndicator: false,
        pageSpacing: 2,
      ),
    );
  }
}
