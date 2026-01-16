import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/routes/app_router.dart';
import 'package:day_bus_user/core/widgets/app_small_button.dart';
import 'package:day_bus_user/core/widgets/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BusResultCard extends StatelessWidget {
  const BusResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Volvo Bus  Multi Axil Ac Sleeper",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹670",
                          style: TextStyle(
                            fontSize: 12.sp,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        8.wBox,
                        Text(
                          "₹400",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                4.hBox,
                // Row 2: Bus Type
                Row(
                  children: [
                    Text(
                      "AC Seater",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    8.wBox,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        "3+2",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
                10.hBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "18:30 - 20:35",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.clock),
                        4.wBox,
                        Text(
                          "2h 30m",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "24 Seats Left",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                16.hBox,
                const DottedDivider(
                  height: 1,
                  color: Color(0xFFE0E0E0),
                  dashWidth: 4,
                  dashSpace: 3,
                ),
                10.hBox,
                // Row 4: Details Button and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppSmallButton(
                      text: "Select Seats",
                      onPressed: () {
                        context.push(AppRouter.selectSeats);
                      },
                      type: ButtonStyleType.solid,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10.h,
                      ),
                      radius: 8.r,
                      fontSize: 14.sp,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(199, 255, 249, 196),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          width: .3,
                          color: const Color.fromARGB(255, 255, 210, 96),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 16.sp,
                            color: const Color.fromARGB(190, 255, 189, 21),
                          ),
                          4.wBox,
                          Text(
                            "4.2",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
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
          // Discount Badge
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(AppImages.shape3),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 6.h),
                child: Text(
                  "20% OFF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
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
