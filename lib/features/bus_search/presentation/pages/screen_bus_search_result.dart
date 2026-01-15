import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/bus_search/presentation/widgets/bus_result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScreenBusSearchResult extends StatelessWidget {
  const ScreenBusSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [_buildFilters(), _buildSummaryStrip(), _buildBusList()],
      ),
    );
  }

  // -------------------------------------------------
  // AppBar
  // -------------------------------------------------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => context.pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Kozhikode",
                style: AppTextStyles.h1.copyWith(fontSize: 16.sp),
              ),
              8.wBox,
              Icon(
                Icons.keyboard_double_arrow_right,
                size: 16.sp,
                color: Colors.black,
              ),
              8.wBox,
              Text(
                "Anchachavidy",
                style: AppTextStyles.h1.copyWith(fontSize: 16.sp),
              ),
              12.wBox,
              Icon(Icons.edit_outlined, size: 16.sp, color: Colors.black),
            ],
          ),
          4.hBox,
          Text(
            "wed,12 November",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------
  // Filters
  // -------------------------------------------------
  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          _buildFilterChip("All", true),
          12.wBox,
          _buildFilterChip("Seater", false),
          12.wBox,
          _buildFilterChip("Sleeper", false),
          12.wBox,
          _buildFilterChip("AC", false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade400,
        ),
      ),
      child: isSelected
          ? Text(
              label,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            )
          : Row(
              children: [
                Icon(Icons.filter_list, size: 14.sp, color: Colors.black87),
                8.wBox,
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
    );
  }

  // -------------------------------------------------
  // Summary Strip
  // -------------------------------------------------
  Widget _buildSummaryStrip() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      width: double.infinity,
      color: const Color(0xFFE3F2FD),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.modernBus),
          8.wBox,
          Text.rich(
            TextSpan(
              text: "We found ",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: "12 buses",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: " for your journey"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------
  // Bus List
  // -------------------------------------------------
  Widget _buildBusList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: 4,
        itemBuilder: (_, __) => const BusResultCard(),
      ),
    );
  }
}
