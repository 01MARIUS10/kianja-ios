import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/photos/photo_type_enum.dart';
import 'package:kianja/routing/routes.dart';

class PhotoHandler extends StatefulWidget {
  const PhotoHandler({
    super.key,
    required this.imageUrls,
    this.height = 320,
    this.width,
    this.photoTypeEnum = PhotoTypeEnum.hiring,
    this.fit = BoxFit.fill,
  });
  final List<String> imageUrls;
  final double? height;
  final double? width;
  final PhotoTypeEnum photoTypeEnum;
  final BoxFit fit;

  @override
  State<PhotoHandler> createState() => _PhotoHandlerState();
}

class _PhotoHandlerState extends State<PhotoHandler> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openPhotoViewer(BuildContext context, int index) {
    context.pushNamed(
      Routes.photoViewer.name,
      extra: {'imageUrls': widget.imageUrls, 'initialIndex': index.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      final String assetImage = switch (widget.photoTypeEnum) {
        PhotoTypeEnum.hiring => Assets.hiring,
        PhotoTypeEnum.trainingCenter => Assets.trainingCenter,
        PhotoTypeEnum.hot => Assets.hot,
        PhotoTypeEnum.event => Assets.events,
      };

      return SizedBox(
        height: widget.height,
        width: widget.width,
        child: GestureDetector(
          onTap: () => _openPhotoViewer(context, 0),
          child: Image.asset(assetImage, fit: widget.fit),
        ),
      );
    }

    if (widget.imageUrls.length == 1) {
      final String assetImage = switch (widget.photoTypeEnum) {
        PhotoTypeEnum.hiring => Assets.hiring,
        PhotoTypeEnum.trainingCenter => Assets.trainingCenter,
        PhotoTypeEnum.hot => Assets.hot,
        PhotoTypeEnum.event => Assets.events,
      };

      return SizedBox(
        height: widget.height,
        width: widget.width,
        child: GestureDetector(
          onTap: () => _openPhotoViewer(context, 0),
          child: CachedNetworkImage(
            imageUrl: widget.imageUrls.first,
            fit: widget.fit,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Image.asset(assetImage, fit: widget.fit),
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _openPhotoViewer(context, index),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrls[index],
                  fit: widget.fit,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.logoKianja, fit: widget.fit),
                ),
              );
            },
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
