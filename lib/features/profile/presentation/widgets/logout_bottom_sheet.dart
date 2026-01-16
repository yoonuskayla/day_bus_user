import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            context: context,
            text: "Log Out",
            textColor: AppColors.primary,
            onTap: () {
              // Handle logout
            },
          ),
          Divider(color: Colors.grey.shade200),

          _buildButton(
            context: context,
            text: "Delete Account",
            textColor: Colors.red,
            onTap: () {
              // Handle delete account
            },
          ),
          20.hBox, // Extra spacing at bottom standard for iOS
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
