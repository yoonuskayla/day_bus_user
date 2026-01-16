import 'package:day_bus_user/core/routes/app_router.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bus Tickets",
            style: AppTextStyles.h1.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          12.hBox,
          _buildLocationInputs(),
          10.hBox,
          _buildDateInput(),
          16.hBox,
          _buildHorizontalDateSelector(),
          24.hBox,
          CustomButton(
            text: "Search buses",
            onPressed: () {
              HapticFeedback.lightImpact();
              context.push(AppRouter.busSearchResult);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInputs() {
    return SizedBox(
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              CustomTextField(
                label: 'From',
                readOnly: true,
                controller: TextEditingController(text: 'Kozhikode'),
                suffixIcon: Icon(
                  Icons.close,
                  color: Colors.grey.shade400,
                  size: 18.sp,
                ),
              ),
              10.hBox,
              CustomTextField(
                label: 'To',
                readOnly: true,
                controller: TextEditingController(text: 'Kalikavu'),
                suffixIcon: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    HapticFeedback.lightImpact();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey.shade400,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 40.w,
            top: 28.h,
            bottom: 28.h,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  HapticFeedback.heavyImpact();
                },
                child: Container(
                  padding: 10.pAll,
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
                    Icons.swap_vert_sharp,
                    color: AppColors.primary,
                    size: 26.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingInput({required String label, required String value}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
              Icon(Icons.close, color: Colors.grey.shade400, size: 18.sp),
            ],
          ),
        ),
        Positioned(
          left: 14.w,
          top: -6.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            color: Colors.white, // important!
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade500,
                fontSize: 11.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateInput() {
    return CustomTextField(
      readOnly: true,
      label: 'Date',
      controller: TextEditingController(text: '25 Dec 2025'),
      prefixIcon: Icon(
        Icons.calendar_today,
        color: Colors.grey.shade400,
        size: 18.sp,
      ),
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              print("Today");
            },
            child: Text(
              "Today",

              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
          ),
          10.wBox,
          InkWell(
            onTap: () {
              print("Tomorrow");
            },
            child: Text(
              "Tomorrow",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
          ),
          16.wBox,
        ],
      ),
    );
  }

  Widget _buildHorizontalDateSelector() {
    return Row(
      children: List.generate(5, (index) {
        final isSelected = index == _selectedDateIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() {
                _selectedDateIndex = index;
              });
            },
            child: Container(
              height: 60.h,
              margin: EdgeInsets.only(right: index == 4 ? 0 : 12.w),
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
                    "Thu",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade600,
                      fontSize: 11.sp,
                    ),
                  ),
                  4.hBox,
                  Text(
                    "0${index + 1}",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: isSelected ? AppColors.primary : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
