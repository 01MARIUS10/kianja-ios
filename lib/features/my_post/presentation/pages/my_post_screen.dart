import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';

class MyPostScreen extends StatelessWidget {
  const MyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      appBar: TitleHeader(title: 'My Posts'),
      child: SizedBox(),
    );
  }
}
