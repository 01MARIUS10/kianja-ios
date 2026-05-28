import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/routing/routes.dart';

class PhotoHandler extends StatefulWidget {
  const PhotoHandler({
    super.key,
    required this.trainingCenterId,
    required this.imageUrls,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final int trainingCenterId;
  final List<String> imageUrls;
  final double? height;
  final double? width;
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
      pathParameters: {'id': widget.trainingCenterId.toString()},
      extra: {'imageUrls': widget.imageUrls, 'initialIndex': index.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return SizedBox(
        height: widget.height,
        width: widget.width,
        child: GestureDetector(
          onTap: () => _openPhotoViewer(context, 0),
          child: Image.asset(Assets.logoKianja, fit: widget.fit),
        ),
      );
    }

    if (widget.imageUrls.length == 1) {
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
                Image.asset(Assets.logoKianja, fit: widget.fit),
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
