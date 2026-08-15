import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/spons_partner.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class BannerPub extends StatelessWidget {
  const BannerPub({super.key, required this.sponsPartner});
  final SponsPartner sponsPartner;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    return Container(
      width: double.infinity,
      height: Constants.size40,
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingMedium),
      color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      child: Row(
        spacing: Constants.spacingSmall,
        children: [
          Container(
            width: Constants.size60,
            height: Constants.size35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: CachedNetworkImage(
                imageUrl: sponsPartner.image,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(Assets.logoKianja, fit: BoxFit.cover),
              ),
            ),
          ),
          Flexible(
            child: Text(
              sponsPartner.title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
