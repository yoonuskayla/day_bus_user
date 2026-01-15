import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/bookings/presentation/pages/screen_bookings.dart';
import 'package:day_bus_user/features/notifications/presentation/pages/screen_notifications.dart';
import 'package:day_bus_user/features/profile/presentation/pages/screen_profile.dart';
import 'package:day_bus_user/features/home/presentation/pages/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    const ScreenHome(),
    const BookingsPage(),
    const ScreenNotifications(),
    const ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Screen Content
          IndexedStack(index: _currentIndex, children: _screens),
          // Custom Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      index: 0,
                      label: "Home",
                      filledIcon: AppImages.homeFilled,
                      outlinedIcon: AppImages.homeOutlined,
                      fallbackIcon: Icons.home_rounded,
                    ),
                    _buildNavItem(
                      index: 1,
                      label: "Bookings",
                      filledIcon: AppImages.busFilled,
                      outlinedIcon: AppImages.busOutlined,
                      fallbackIcon: Icons.directions_bus_rounded,
                    ),
                    _buildNavItem(
                      index: 2,
                      label: "Notifications",
                      filledIcon: AppImages.notificationFilled,
                      outlinedIcon: AppImages.notificationOutlined,
                      fallbackIcon: Icons.notifications_rounded,
                    ),
                    _buildNavItem(
                      index: 3,
                      label: "Profile",
                      filledIcon: AppImages.personFilled,
                      outlinedIcon: AppImages.personOutlined,
                      fallbackIcon: Icons.person_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required String filledIcon,
    required String outlinedIcon,
    required IconData fallbackIcon,
  }) {
    final bool isSelected = _currentIndex == index;
    final Color itemColor = isSelected
        ? AppColors.primary
        : Colors.grey.shade400;

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
        HapticFeedback.lightImpact();
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? filledIcon : outlinedIcon,
            height: 24.h,
            width: 24.h,
            colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
            placeholderBuilder: (context) =>
                Icon(fallbackIcon, size: 24.h, color: itemColor),
          ),
          4.hBox,
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: itemColor,
            ),
          ),
        ],
      ),
    );
  }
}
