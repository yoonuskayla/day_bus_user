import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusSearchCard extends StatefulWidget {
  const BusSearchCard({super.key});

  @override
  State<BusSearchCard> createState() => _BusSearchCardState();
}

class _BusSearchCardState extends State<BusSearchCard> {
  int _selectedDateIndex = 0; // 0 for the first date

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Bus Tickets",
            style: AppTextStyles.h1.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.hBox,
          _buildLocationInputs(),
          16.hBox,
          _buildDateInput(),
          16.hBox,
          _buildHorizontalDateSelector(),
          24.hBox,
          CustomButton(
            text: "Search buses",
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInputs() {
    return SizedBox(
      height: 120.h,
      child: Stack(
        children: [
          Column(
            children: [
              _buildInput("From", "Kozhikode"),
              12.hBox,
              _buildInput("To", "Kalikavu"),
            ],
          ),
          Positioned(
            right: 16.w,
            top: 28.h,
            bottom: 28.h,
            child: Center(
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.swap_vert,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.grey.shade500,
                  fontSize: 11.sp,
                ),
              ),
              2.hBox,
              Text(
                value,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          Icon(Icons.close, color: Colors.grey.shade400, size: 18.sp),
        ],
      ),
    );
  }

  Widget _buildDateInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: Colors.grey.shade400,
            size: 20.sp,
          ),
          12.wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Date",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade500,
                    fontSize: 11.sp,
                  ),
                ),
                2.hBox,
                Text(
                  "01 Jan 2026",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Today",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: " Tomorrow",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalDateSelector() {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7, // Showing a week
        separatorBuilder: (context, index) => 12.wBox,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedDateIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDateIndex = index;
              });
            },
            child: Container(
              width: 50.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFD6E9FA)
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12.r),
                border: isSelected
                    ? Border.all(color: AppColors.primary.withOpacity(0.3))
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thu", // Placeholder day
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade600,
                      fontSize: 11.sp,
                    ),
                  ),
                  4.hBox,
                  Text(
                    "0${index + 1}", // Placeholder date
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: isSelected ? AppColors.primary : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
