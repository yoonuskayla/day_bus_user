import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Replace with your actual import path
// import 'package:day_bus_user/core/widgets/app_network_image.dart';

class GooglePayStyleCarousel extends StatefulWidget {
  final List<String> images;
  final double height;

  const GooglePayStyleCarousel({
    super.key,
    required this.images,
    this.height = 200,
  });

  @override
  State<GooglePayStyleCarousel> createState() => _GooglePayStyleCarouselState();
}

class _GooglePayStyleCarouselState extends State<GooglePayStyleCarousel> {
  late final PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    // 0.8 means the center card takes 80% width,
    // leaving 10% on the left and 10% on the right for neighbors.
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        // padEnds: true ensures the current item stays centered
        padEnds: true,
        itemBuilder: (context, index) {
          // Calculate how far the card is from the center (0.0 = center)
          double relativePosition = index - _currentPage;

          // Scale: 1.0 at center, 0.85 at sides
          // .abs() ensures both left and right neighbors shrink the same way
          double scale = max(0.85, 1.0 - (relativePosition.abs() * 0.15));

          // Opacity: Make side cards slightly faded (optional, like Google Pay)
          double opacity = max(0.5, 1.0 - (relativePosition.abs() * 0.5));

          return Transform.scale(
            scale: scale,
            alignment: Alignment.center, // Shrink/Expand to/from center
            child: Opacity(
              opacity: opacity,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    if (relativePosition.abs() <
                        0.1) // Only show shadow for center card
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
