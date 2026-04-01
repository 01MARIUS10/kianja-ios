import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_header.dart';

class MyPostScreen extends StatelessWidget {
  const MyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      appBar: MyPostHeader(title: 'My Posts'),
      child: SizedBox(),
    );
  }
}
