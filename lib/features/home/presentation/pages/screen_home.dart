import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_decorations.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';

import 'package:day_bus_user/features/home/presentation/widgets/bus_search_card.dart';
import 'package:day_bus_user/features/home/presentation/widgets/home_header.dart';
import 'package:day_bus_user/features/home/presentation/widgets/offers_section.dart';
import 'package:day_bus_user/features/home/presentation/widgets/other_services_section.dart';
import 'package:day_bus_user/features/home/presentation/widgets/scheduled_trip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          // Fixed background gradient
          Container(decoration: AppDecorations.mainGradient),
          SafeArea(
            child: Column(
              children: [
                16.hBox,
                // Fixed Header
                const HomeHeader(),
                6.hBox,
                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        // Banner Image
                        Positioned(
                          top: 10.h,
                          left: 0,
                          right: 0,
                          height: 200.h,
                          child: SvgPicture.asset(AppImages.busIllustration),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 180.h),
                          child: Column(
                            children: [
                              const BusSearchCard(),
                              24.hBox,
                              const OtherServicesSection(),
                              24.hBox,
                              const ScheduledTripCard(),
                              24.hBox,
                              const OffersSection(),
                              24.hBox,
                              SvgPicture.asset(AppImages.mountainIllustration),
                              54.hBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
