import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerJobDetailIndicator extends StatelessWidget {
  const ShimmerJobDetailIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      highlightColor: isDark
          ? AppColors.darkBorderStrong
          : AppColors.lightBorderStrong,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Constants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
              ),
              child: const Text(''),
            ),
            const SizedBox(height: Constants.spacingExtraSmall),
            Container(
              width: MediaQuery.sizeOf(context).width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
              ),
              child: const Text(''),
            ),
            const SizedBox(height: Constants.spacingExtraSmall),
            Container(
              width: MediaQuery.sizeOf(context).width / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
              ),
              child: const Text(''),
            ),
            const SizedBox(height: Constants.paddingMedium),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusMedium,
                ),
              ),
            ),
            const SizedBox(height: Constants.paddingMedium),
            Container(
              width: MediaQuery.sizeOf(context).width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusSmall,
                ),
              ),
              child: const Text(''),
            ),
            const SizedBox(height: Constants.paddingMedium),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Constants.borderRadiusMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
