import 'package:flutter/material.dart';

class JobOffersFilterScreen extends StatelessWidget {
  const JobOffersFilterScreen({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: children));
  }
}
