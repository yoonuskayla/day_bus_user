import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final Widget? errorWidget;
  final double bdRadius;
  final Duration fadeDuration;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 50,
    this.width = 50,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.bdRadius = 12,
    this.fadeDuration = const Duration(milliseconds: 250),
  });

  @override
  Widget build(BuildContext context) {
    // Handle empty/null URLs gracefully
    if (imageUrl.isEmpty) {
      return _simpleErrorImage(size: height * 0.4, bdRadius: bdRadius);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(bdRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height.h,
        width: width.w,
        fit: fit,

        // ✨ Smooth fade animation
        fadeInDuration: fadeDuration,
        fadeOutDuration: const Duration(milliseconds: 180),

        // 🔹 Shimmer placeholder
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: height.h,
            width: width.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(bdRadius.r),
              color: Colors.white,
            ),
          ),
        ),

        // 🔹 Error widget with override support
        errorWidget: (context, url, error) =>
            errorWidget ??
            _simpleErrorImage(size: height * 0.4, bdRadius: bdRadius),

        // 🔹 Optional caching control (good for large images)
        memCacheHeight: (height * 2).toInt(),
        memCacheWidth: (width * 2).toInt(),
        maxHeightDiskCache: (height * 3).toInt(),
        maxWidthDiskCache: (width * 3).toInt(),
      ),
    );
  }
}

Widget _simpleErrorImage({double size = 22, double bdRadius = 12}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(bdRadius.r),
      color: Colors.grey.shade200,
    ),
    child: Icon(
      Icons.image_not_supported_outlined,
      size: size.sp,
      color: Colors.grey.shade500,
    ),
  );
}
