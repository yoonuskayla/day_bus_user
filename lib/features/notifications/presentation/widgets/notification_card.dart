import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final String date;

  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200, width: .5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          8.hBox,
          Text(
            body,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12.sp,
              color: const Color(0xFF636363),
              height: 1.5,
            ),
          ),
          12.hBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                time,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 10.sp,
                  color: Colors.grey.shade400,
                ),
              ),
              if (date.isNotEmpty) ...[
                Text(
                  " | ",
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 10.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 10.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
