import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/home/presentation/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Offers",
            style: AppTextStyles.h1.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        12.hBox,
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Placeholder count
            separatorBuilder: (context, index) => 16.wBox,
            itemBuilder: (context, index) {
              return const OfferCard();
            },
          ),
        ),
      ],
    );
  }
}
