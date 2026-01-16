import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/routes/app_router.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/core/widgets/app_network_image.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/logout_bottom_sheet.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context: context,
        title: "Profile",
        isBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildHeaderSection(), _buildMenuSection(context)],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.profileBg),
        Positioned(
          bottom: 14.h,
          left: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
                bdRadius: 16.r,
                imageUrl:
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
              ),
              10.hBox,
              Text(
                "Megha Madhavan",
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              4.hBox,
              Text(
                "9544264781",
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 13.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 120.h),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_rounded,
            text: "My Information",
            onTap: () {
              context.push(AppRouter.myInformation);
            },
          ),
          ProfileMenuItem(
            icon: Icons.group_rounded,
            text: "Passangers",
            onTap: () {
              context.push(AppRouter.passengers);
            },
          ),
          ProfileMenuItem(
            icon: Icons.receipt_long,
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
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => const LogoutBottomSheet(),
              );
            },
          ),
          ProfileMenuItem(
            icon: Icons.local_offer_rounded,
            text: "offers",
            onTap: () {
              context.push(AppRouter.offers);
            },
          ),
          ProfileMenuItem(
            icon: Icons.g_translate_rounded,
            text: "Languages",
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => const LanguageBottomSheet(),
              );
            },
          ),
          ProfileMenuItem(icon: Icons.star, text: "Rate App", onTap: () {}),
          ProfileMenuItem(
            icon: Icons.admin_panel_settings,
            text: "Privacy Policy",
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.description_rounded,
            text: "Terms & Conditions",
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.info_rounded,
            text: "About Us",
            onTap: () {},
          ),
          25.hBox,
          Center(child: SvgPicture.asset(AppImages.kaylaLogo)),
          25.hBox,
        ],
      ),
    );
  }
}
