import 'dart:async';
import 'package:flutter/material.dart';

class BannersCarousel extends StatefulWidget {
  const BannersCarousel({
    super.key,
    required this.assets, // e.g. ['assets/b1.png','assets/b2.png']
    this.height = 160,
    this.borderRadius = 12,
    this.viewportFraction = 1,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.onTap,
    this.showShadow = true,
    this.dotsColor = Colors.white,
    this.activeDotColor,
    this.fit = BoxFit.fill,
  }) : assert(assets.length >= 2, 'Provide at least 2 banners');

  final List<String> assets;
  final double height;
  final double borderRadius;
  final double viewportFraction;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final void Function(int index)? onTap;
  final bool showShadow;
  final Color dotsColor;
  final Color? activeDotColor;
  final BoxFit fit;

  @override
  State<BannersCarousel> createState() => _BannersCarouselState();
}

class _BannersCarouselState extends State<BannersCarousel> {
  late final PageController _controller;
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: widget.viewportFraction);
    _startAutoplay();
  }

  void _startAutoplay() {
    _timer?.cancel();
    if (!widget.autoPlay) return;
    _timer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!mounted) return;
      final next = (_index + 1) % widget.assets.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void didUpdateWidget(covariant BannersCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autoPlay != widget.autoPlay ||
        oldWidget.autoPlayInterval != widget.autoPlayInterval) {
      _startAutoplay();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.assets.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GestureDetector(
                  onTap: () => widget.onTap?.call(i),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      boxShadow: widget.showShadow
                          ? const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ]
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      child: Image.asset(
                        widget.assets[i],
                        fit: widget.fit,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
