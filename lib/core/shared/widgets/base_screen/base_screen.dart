import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/banner_pub.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
  });
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const BannerPub(),
          Expanded(child: child),
          const BannerPub(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
