import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/home/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherServicesSection extends StatelessWidget {
  const OtherServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Other Services",
            style: AppTextStyles.h1.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          12.hBox,
          ServiceCard(
            title: "Discover Tourist Buses & Strangers trips",
            description:
                "Explore and contact tourist buses and contract carriers...",
            buttonText: "Get Contacts",
            onPressed: () {},
            buttonPosition: Alignment.centerRight,
            contentPadding: EdgeInsets.only(
              left: 120.w,
              right: 12.w,
              top: 12.w,
              bottom: 12.w,
            ),
            backgroundStackChildren: [
              Positioned(bottom: 0, child: SvgPicture.asset(AppImages.shape1)),
              Positioned(
                top: 20.h,
                left: -60,
                child: Image.asset(AppImages.touristBus, height: 70.h),
              ),
            ],
          ),
          12.hBox,
          ServiceCard(
            title: "Search Limited & Ordinary Buses",
            description:
                "Easily search limited and ordinary buses in your area. Travel smarter with clear route and service information.",
            buttonText: "Search Now",
            buttonPosition: Alignment.centerLeft,
            onPressed: () {},
            contentPadding: EdgeInsets.only(
              right: 120.w,
              left: 12.w,
              top: 12.w,
              bottom: 12.w,
            ),
            backgroundStackChildren: [
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(AppImages.shape2),
              ),
              Positioned(
                bottom: 0.h,
                right: -60,
                child: Image.asset(AppImages.ordinaryBus, height: 130.h),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
