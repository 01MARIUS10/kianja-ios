import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';

class PostTrainingCenterScreen extends StatelessWidget {
  const PostTrainingCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;

    return const BaseScreen(
      appBar: TitleHeader(title: 'Post a training center'),
      child: Center(child: Text('Post a training center')),
    );
  }
}
