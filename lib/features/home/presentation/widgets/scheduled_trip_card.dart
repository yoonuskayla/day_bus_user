import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduledTripCard extends StatelessWidget {
  const ScheduledTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Scheduled Trip",
            style: AppTextStyles.h1.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        12.hBox,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Route and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kozhikode → Kalikavu",
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "Nov 13",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ],
              ),
              8.hBox,
              // Time
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                  4.wBox,
                  Text(
                    "06:30 PM - 08:35 PM",
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 13.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  8.wBox,
                  Text(
                    "• 2h 30m",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              12.hBox,
              // Status and E-Ticket
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16.sp,
                      ),
                      4.wBox,
                      Text(
                        "Confirmed",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_rounded,
                          size: 16.sp,
                          color: AppColors.primary,
                        ),
                        4.wBox,
                        Text(
                          "E-Ticket",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
