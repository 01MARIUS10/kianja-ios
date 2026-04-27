import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIndicator extends StatelessWidget {
  const ShimmerIndicator({super.key, this.size = 60.0});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. The original colored logo underneath
          Image.asset(
            Assets.logoKianja,
            width: size,
            height: size,
            fit: BoxFit.contain,
          ),
          // 2. The shimmer effect applied only as a white sheen over the logo's shape
          Shimmer.fromColors(
            baseColor: AppColors.darkSurface,
            highlightColor: AppColors.lightSurface,
            child: Image.asset(
              Assets.logoKianja,
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
