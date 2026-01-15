import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Illustration Background
          Positioned(
            right: -20,
            width: 150.w,
            bottom: 0,
            child: SvgPicture.asset(
              AppImages.offerPlaceHolder,
              fit: BoxFit.contain,
              height: 100,
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Flat 12% off on Saturday & Sunday bookings",
                  maxLines: 2,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),

                8.hBox,
                Text(
                  "A little thank-you for choosing Day Bus.",
                  maxLines: 1,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 11.sp,
                    color: Colors.black87,
                  ),
                ),

                4.hBox,
                Text(
                  "Valid till 25 Nov 2025",
                  maxLines: 1,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 10.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                8.hBox,
                AppSmallButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  text: 'Apply Offer',
                  onPressed: () {},
                  type: ButtonStyleType.solid,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
