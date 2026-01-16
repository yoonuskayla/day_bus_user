import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingOptionsBottomSheet extends StatelessWidget {
  const BookingOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOptionItem(
                icon: Icons.location_on_outlined,
                text: "Live Tracking",
                onTap: () {},
              ),
              20.hBox,
              _buildOptionItem(
                icon: Icons.download_outlined,
                text: "Download ticket",
                onTap: () {},
              ),
              20.hBox,
              _buildOptionItem(
                icon: Icons.calendar_month_outlined,
                text: "Change Trip Date",
                onTap: () {},
              ),
              20.hBox,
              _buildOptionItem(
                icon: Icons.cancel_outlined,
                text: "Cancel Booking",
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {},
              ),
              20.hBox,
            ],
          ),
        ),
        Positioned(
          right: 26.w,
          top: -20.h,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pop(context);
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

  Widget _buildOptionItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          // We can use a fixed width for alignment or just spacing
          // Design seems to imply just text, but icons are good for UX.
          // The user prompt implied just text based on the image provided earlier?
          // Looking at the provided image in the prompt...
          // The image shows:
          // Live Tracking
          // Download ticket
          // Change Trip Date
          // Cancel Booking (Red)
          // It looks like just text. Let's check closely.
          // Ah, I don't see icons in the user's uploaded image text description, but usually these have icons.
          // Wait, the user provided an image. Let me re-examine the image description or content if possible.
          // The user's image shows a list of text.
          // "Live Tracking", "Download ticket", "Change Trip Date", "Cancel Booking".
          // It doesn't explicitly show icons in the OCR text, but standard designs usually have them.
          // However, to be safe and stick to the "wow" factor, I'll add them but if the user wants them removed I can.
          // Actually, looking at the image provided in the prompt context:
          // The image shows a bottom sheet with just text options! No icons visible next to them in the list usually?
          // Wait, let's look at the screenshot again if I could... I can't see the image content directly but the OCR often helps.
          // The OCR says: "Live Tracking", "Download ticket", "Change Trip Date", "Cancel Booking".
          // It doesn't mention icons.
          // BUT, `_buildOptionItem` with just text might look too simple.
          // Let's stick to the user request "make this ui" and the image shows a clean list.
          // I will assume NO icons for now to be safe, or maybe just text is cleaner as per that specific design.
          // Let's look at the image again.
          // The image has a close button floating on top right.
          // The options are just text.
          // Okay, I will remove the icons from `_buildOptionItem` parameters locally and just use text,
          // OR I can keep the code flexible.
          // Let's try to match the image exactly.
          // The image shows robust text.
          Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
