import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final List<Widget> backgroundStackChildren;
  final EdgeInsetsGeometry contentPadding;
  final Alignment buttonPosition;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    required this.backgroundStackChildren,
    required this.buttonPosition,

    this.contentPadding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            ...backgroundStackChildren,
            Padding(
              padding: contentPadding,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        4.hBox,
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 10.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        8.hBox,
                        Align(
                          alignment: buttonPosition,
                          child: AppSmallButton(
                            text: buttonText,
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              size: 16.sp,
                              color: AppColors.primary,
                            ),
                            onPressed: onPressed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
