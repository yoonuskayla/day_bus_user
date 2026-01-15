import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonStyleType { outline, solid }

class AppSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final ButtonStyleType type;

  // ➤ Direct control props
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final double? radius;

  const AppSmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = ButtonStyleType.outline,
    this.height,
    this.width,
    this.padding,
    this.fontSize,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSolid = type == ButtonStyleType.solid;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius ?? 20.r),
      child: Container(
        height: height,
        width: width,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSolid
              ? AppColors.primary
              : AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 20.r),
          border: isSolid
              ? null
              : Border.all(color: AppColors.primary, width: .5),
        ),
        child: Row(
          mainAxisSize: width != null ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSolid ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 10.sp,
              ),
            ),
            if (icon != null) ...[8.wBox, icon!],
          ],
        ),
      ),
    );
  }
}
