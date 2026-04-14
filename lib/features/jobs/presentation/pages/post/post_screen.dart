import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_header.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      appBar: PostHeader(title: 'Post'),
      child: SizedBox(),
    );
  }
}
