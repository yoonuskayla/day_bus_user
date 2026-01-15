import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/features/bookings/presentation/widgets/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    "On going",
    "Upcoming",
    "Completed",
    "Canceled",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Bookings",
        isBackButton: false,
      ),
      body: Column(
        children: [
          // Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: List.generate(_filters.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: _buildFilterChip(index),
                );
              }),
            ),
          ),

          // Bookings List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 120.h,
                top: 15.h,
              ),
              itemCount: 3, // Mock data count
              itemBuilder: (context, index) {
                return const BookingCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(int index) {
    final isSelected = _selectedFilterIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilterIndex = index;
          HapticFeedback.lightImpact();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFBBDEFB),
          ),
        ),
        child: Text(
          _filters[index],
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
