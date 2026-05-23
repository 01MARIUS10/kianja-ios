import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';

class PhotoViewerScreen extends StatefulWidget {
  const PhotoViewerScreen({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });
  final List<String> imageUrls;
  final int initialIndex;

  @override
  State<PhotoViewerScreen> createState() => _PhotoViewerScreenState();
}

class _PhotoViewerScreenState extends State<PhotoViewerScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: widget.imageUrls.length > 1
            ? Text(
                '${_currentIndex + 1} / ${widget.imageUrls.length}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            : null,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: widget.imageUrls.isEmpty
            ? Center(child: Image.asset(Assets.logoKianja, fit: BoxFit.contain))
            : PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrls[index],
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.logoKianja, fit: BoxFit.contain),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
