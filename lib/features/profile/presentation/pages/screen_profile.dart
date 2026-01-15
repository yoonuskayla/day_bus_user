import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Profile",
          style: AppTextStyles.popins.copyWith(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(AppImages.profileBg),
                Positioned(
                  bottom: 20.h,
                  left: 16.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.hBox,
                      Text(
                        "Megha Madhavan",
                        textAlign: TextAlign.left,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      4.hBox,
                      Text(
                        "9544264781",
                        textAlign: TextAlign.left,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 13.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Menu List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_rounded,
                    text: "My Information",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.group_rounded,
                    text: "Passangers",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.receipt_long_rounded,
                    text: "Transaction History",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.confirmation_number_rounded,
                    text: "Become an Agent",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings_rounded,
                    text: "Account Settings",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.local_offer_rounded,
                    text: "offers",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.g_translate_rounded,
                    text: "Languages",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.star_rounded,
                    text: "Rate App",
                    onTap: () {},
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
