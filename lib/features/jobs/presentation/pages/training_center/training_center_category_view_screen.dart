import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';

class TrainingCenterCategoryViewScreen extends StatelessWidget {
  const TrainingCenterCategoryViewScreen({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: TitleHeader(title: category),
      child: Container(color: Colors.amber),
    );
  }
}
