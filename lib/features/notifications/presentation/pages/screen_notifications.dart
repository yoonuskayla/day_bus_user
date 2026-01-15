import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/features/notifications/presentation/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Notifications",
        isBackButton: false,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 15.h,
          bottom: 120.h,
        ),
        children: const [
          NotificationCard(
            title: "Hey there! Glad to have you on Day Bus !",
            body:
                "Ready to book your ticket? Find your route, grab your seat, and get set for a smooth journey",
            time: "11 : 20 AM",
            date: "14, nov 2025",
          ),
          NotificationCard(
            title:
                "Your bus is on the way! Get ready to hop in \u{1F60A}", // Smile emoji
            body:
                "Your bus is getting close to your stop. Please move to the boarding point and get ready to hop in smoothly.",
            time: "11 : 20 AM",
            date: "",
          ),
        ],
      ),
    );
  }
}
