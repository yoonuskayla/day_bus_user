import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final bool isFullWidth;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final WidgetStateProperty<Color?>? overlayColor;
  final BorderSide? borderSide;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.height = 52,
    this.width,
    this.padding,
    this.borderRadius,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.textStyle,
    this.isFullWidth = true,
    this.prefixIcon,
    this.suffixIcon,
    this.overlayColor,
    this.isLoading = false,
    this.borderSide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (isFullWidth ? double.infinity : null),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 4.h,
          backgroundColor: backgroundColor,
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 9.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, const SizedBox(width: 8)],
            isLoading
                ? AppLoader(color: Colors.white)
                : Text(
                    text,
                    style:
                        textStyle ??
                        TextStyle(
                          fontSize: 17.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
            if (suffixIcon != null) ...[const SizedBox(width: 8), suffixIcon!],
          ],
        ),
      ),
    );
  }
}
