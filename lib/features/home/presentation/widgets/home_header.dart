import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_decorations.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppDecorations.mainGradient,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.white24,
                        backgroundImage: const NetworkImage(
                          'https://i.pravatar.cc/150?u=megha',
                        ), // Placeholder
                      ),
                      12.wBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Hello, ',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Megha Madhavan 👋',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          4.hBox,
                          Text(
                            'Welcome to DAY BUS',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
              32.hBox,
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Making ',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'everyDay',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: ' travel easier.',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.hBox,
              // Bus Illustration Placeholder (Since we don't have the asset)
              // In a real app, use Image.asset('assets/images/bus_header.png')
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Simple representation of the mountains/road
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(
                          0.2,
                        ), // Placeholder for landscape
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100.r),
                          topRight: Radius.circular(100.r),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.directions_bus_filled,
                      size: 80.sp,
                      color: Color(0xFF1A2F4B), // Dark Bus Color
                    ),
                  ],
                ),
              ),
              40.hBox, // Space for the overlapping card
            ],
          ),
        ),
      ),
    );
  }
}
