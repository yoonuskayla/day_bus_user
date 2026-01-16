import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_small_button.dart';
import 'package:day_bus_user/features/bookings/presentation/widgets/ticket_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:day_bus_user/features/bookings/presentation/widgets/booking_options_bottom_sheet.dart';

class BookingCard extends StatelessWidget {
  final bool isCompleted;
  final bool isCancelled;

  const BookingCard({
    super.key,
    this.isCompleted = false,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImages.appLogo, fit: BoxFit.cover),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "Nov 13,2025, Thu",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      10.wBox,
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (context) =>
                                const BookingOptionsBottomSheet(),
                          );
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.hBox,

              // Route Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStationInfo(
                          "Kozhikode",
                          "Bus Stand Near Railway Station",
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Text(
                          "18:30",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: SvgPicture.asset(AppImages.arrow),
                        ),
                        10.hBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.clock,
                              height: 16.h,
                              color: Colors.grey.shade500,
                            ),
                            4.wBox,
                            Text(
                              "2h 30m",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildStationInfo(
                          "Kalikavu",
                          "Kalikavu Bus Stand",
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        Text(
                          " 20:35",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              12.hBox,

              // Action Buttons / Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                            size: 16.sp,
                          ),
                          4.wBox,
                          Text(
                            "Confirmed",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.wBox,
                  if (!isCompleted && !isCancelled) ...[
                    AppSmallButton(
                      text: "Find Boarding point",
                      onPressed: () {},
                      type: ButtonStyleType.solid,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      radius: 20.r,
                      fontSize: 12.sp,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStationInfo(
    String city,
    String station, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          city,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        4.hBox,
        Text(
          station,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
