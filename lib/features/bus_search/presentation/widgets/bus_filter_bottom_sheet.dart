import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_small_button.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BusFilterBottomSheet extends StatefulWidget {
  const BusFilterBottomSheet({super.key});

  @override
  State<BusFilterBottomSheet> createState() => _BusFilterBottomSheetState();
}

class _BusFilterBottomSheetState extends State<BusFilterBottomSheet> {
  // Mock Data
  final List<String> _categories = [
    "All",
    "Listed by",
    "Bus Type",
    "Arrival Time at Destination",
  ];

  // Options for "Listed by"
  final List<String> _listedByOptions = [
    "Price Low to High",
    "Price High to Low",
    "Early Departure",
    "Late Departure",
  ];

  int _selectedCategoryIndex = 1;

  String? _selectedSortOption = "Price Low to High";

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 600.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            children: [
              // 1. Header
              _buildHeader(context),
              Divider(height: 1, color: Colors.grey.shade200),

              // 2. Content (Split View)
              Expanded(
                child: Row(
                  children: [
                    // Left Side (Categories)
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Color(0xFFF8F9FA), // Light grey background
                        child: ListView.builder(
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            return _buildCategoryItem(index);
                          },
                        ),
                      ),
                    ),
                    // Right Side (Options)
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: _buildRightContent(),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.grey.shade200),
              // 3. Footer
              _buildFooter(context),
            ],
          ),
        ),

        // Close Button
        Positioned(
          right: 26.w,
          top: -20.h,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 3),
              ),
              child: Icon(Icons.close, color: Colors.black, size: 24.sp),
            ),
          ),
        ),
      ],
    );
  }

  // --- Header ---
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Filters",
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Close button moved to Stack
        ],
      ),
    );
  }

  // --- Category Item (Left) ---
  Widget _buildCategoryItem(int index) {
    final isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            decoration: BoxDecoration(),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(
              _categories[index],
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.primary : Colors.black87,
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  width: 4.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.r),
                      bottomLeft: Radius.circular(4.r),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // --- Right Content (Options) ---
  Widget _buildRightContent() {
    // Determining options based on category
    // For now, only "Listed by" has confirmed options from prompt
    if (_categories[_selectedCategoryIndex] == "Listed by") {
      return ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: _listedByOptions.length,
        itemBuilder: (context, index) {
          final option = _listedByOptions[index];
          final isSelected = _selectedSortOption == option;
          return _buildRadioOptionItem(option, isSelected, () {
            HapticFeedback.lightImpact();
            setState(() {
              _selectedSortOption = option;
            });
          });
        },
      );
    }
    // Placeholder for other categories
    return Center(
      child: Text("No options available", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildRadioOptionItem(
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: AppColors.primary, size: 20.sp),
          ],
        ),
      ),
    );
  }

  // --- Footer ---
  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: AppSmallButton(
              text: "Clear",
              onPressed: () {
                // Clear logic
                HapticFeedback.lightImpact();
              },
              fontSize: 13.sp,
              type: ButtonStyleType.outline,
              radius: 30.r,
              height: 48.h,
            ),
          ),
          16.wBox,
          Expanded(
            child: CustomButton(
              text: "Apply Filter",
              onPressed: () {
                HapticFeedback.lightImpact();

                context.pop();
              },
              textStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                color: Colors.white,
              ),
              borderRadius: 30.r,
              height: 48.h,
            ),
          ),
        ],
      ),
    );
  }
}
