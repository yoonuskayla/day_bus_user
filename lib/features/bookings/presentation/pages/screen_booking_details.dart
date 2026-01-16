import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_dimensions.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/core/widgets/app_network_image.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/features/bookings/presentation/widgets/bus_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "More Details"),
      body: SingleChildScrollView(
        child: Column(children: [_buildContent(context), 60.hBox]),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTicketOverviewCard(),
          20.hBox,
          _buildSectionTitle(
            "Ticket Price Details",
            subtitle: "fare information for your ticket.",
          ),
          10.hBox,
          _buildPriceDetailsCard(),
          20.hBox,
          _buildSectionTitle(
            "Boarding & Departure",
            subtitle:
                "See where you board and get down, along with the bus timings.",
          ),
          10.hBox,
          _buildBoardingDroppingCard(),
          20.hBox,
          _buildSectionTitle(
            "Passanger Details",
            subtitle: "Details of the Traveller",
          ),
          10.hBox,
          _buildPassengerList(),
          20.hBox,
          _buildSectionTitle(
            "Bus Details",
            subtitle: "Bus Information and Schedule",
          ),
          10.hBox,
          _buildBusDetailsCard(context),
          20.hBox,
          _buildSectionTitle(
            "Bus Operator Contact Number",
            subtitle:
                "Use this number to contact the bus operator for trip-related assistance.",
          ),
          10.hBox,
          _buildOperatorContactCard(),
          20.hBox,
          _buildSectionTitle(
            "Direction to the Boarding Point",
            subtitle:
                "Easy directions to help you reach the boarding location.",
          ),
          10.hBox,
          Container(
            padding: AppDimensions.screenPadall,
            decoration: _cardDecoration(),
            child: Column(
              children: [
                _buildMapCard(context),
                20.hBox,
                CustomButton(text: "Get Direction", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Section Titles
  Widget _buildSectionTitle(String title, {String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (subtitle != null) ...[
          4.hBox,
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12.sp,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTicketOverviewCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Logo
              SvgPicture.asset(AppImages.appLogo, height: 40.h),
              _buildDateChip("Nov 13,2025, Thu"),
            ],
          ),
          20.hBox,
          // Route Row
          // Route Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStationInfo(
                      "Kozhikode",
                      "Bus Stand Near Railway Station",
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Text(
                      "18:30",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SvgPicture.asset(AppImages.arrow),
                    ),
                    10.hBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.clock,
                          height: 16.h,
                          color: Colors.grey.shade500,
                        ),
                        4.wBox,
                        Text(
                          "2h 30m",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildStationInfo(
                      "Kalikavu",
                      "Kalikavu Bus Stand",
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    Text(
                      " 20:35",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.hBox,
          // Status and E-Ticket
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16.sp,
                      ),
                      4.wBox,
                      Text(
                        "Confirmed",
                        style: _boldStyle(12, color: Colors.green),
                      ),
                    ],
                  ),
                  7.hBox,
                  Row(
                    children: [
                      Icon(
                        Icons.download,
                        color: AppColors.primary,
                        size: 16.sp,
                      ),
                      4.wBox,
                      Text(
                        "E TICKET",
                        style: _boldStyle(12, color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Price Details Card
  Widget _buildPriceDetailsCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _buildPriceRow("Seat 26", "₹200"),
          10.hBox,
          _buildPriceRow("Seat 27", "₹200"),
          Divider(color: Colors.grey.shade200, height: 20.h),
          _buildPriceRow("Total ", "₹400", isTotal: true, suffix: "(2 seats)"),
        ],
      ),
    );
  }

  // 3. Boarding/Dropping Card
  Widget _buildBoardingDroppingCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: _cardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Boarding point", style: _boldStyle(14)),
                4.hBox,
                Text("New Bus Stand Calicut", style: _greyStyle(12)),
                8.hBox,
                _buildTimeChip("18:30"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Dropping point", style: _boldStyle(14)),
                4.hBox,
                Text("Kalikavu Town", style: _greyStyle(12)),
                8.hBox,
                _buildTimeChip("21:20"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. Passenger List
  Widget _buildPassengerList() {
    return Column(
      children: [
        _buildPassengerCard(
          "Megha Madhavan",
          "Female",
          "23 Years",
          "M",
          Color(0xFFD1E6FF),
        ),
        15.hBox,
        _buildPassengerCard(
          "Kumar.G",
          "Male",
          "24 Years",
          "K",
          Color(0xFFD1E6FF),
        ),
      ],
    );
  }

  Widget _buildPassengerCard(
    String name,
    String gender,
    String age,
    String initial,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: _boldStyle(18, color: AppColors.primary),
            ),
          ),
          15.wBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: _boldStyle(16)),
              8.hBox,
              Row(
                children: [
                  _buildSmallChip(gender),
                  8.wBox,
                  _buildSmallChip(age),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 5. Bus Details Card with Carousel
  Widget _buildBusDetailsCard(BuildContext context) {
    final busImages = [
      "https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=2939&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?q=80&w=2941&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?q=80&w=2941&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?q=80&w=2941&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?q=80&w=2941&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1570125909232-eb263c188f7e?q=80&w=2941&auto=format&fit=crop",
    ];
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Galaxy Travels Private Limited", style: _boldStyle(16)),
          8.hBox,
          Row(
            children: [
              Text("06:30 PM - 08:35 PM", style: _greyStyle(12)),
              Container(
                height: 12.h,
                width: 1,
                color: Colors.grey.shade300,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
              ),
              Text("wed, 12 Nov", style: _greyStyle(12)),
              Container(
                height: 12.h,
                width: 1,
                color: Colors.grey.shade300,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
              ),
              Text("KL 55 C 3278", style: _greyStyle(12)),
            ],
          ),
          15.hBox,
          SizedBox(
            height: 180.h,
            child: CarouselView(
              itemSnapping: true,
              scrollDirection: Axis.horizontal,
              itemExtent: context.screenWidth * .76,
              children: List.generate(busImages.length, (index) {
                return Center(
                  child: AppNetworkImage(
                    imageUrl: busImages[index],
                    bdRadius: 20.r,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  //  Operator Contact Card
  Widget _buildOperatorContactCard() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: Color(0xFFD1E6FF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Text("M", style: _boldStyle(18, color: AppColors.primary)),
          ),
          15.wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Melbin Jhon.L", style: _boldStyle(16)),
                4.hBox,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    "9544264781",
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Color(0xFFE0F4E0),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: .5),
            ),
            child: Icon(Icons.call, color: Colors.green, size: 20.sp),
          ),
        ],
      ),
    );
  }

  // 7. Map Card
  Widget _buildMapCard(BuildContext context) {
    return AppNetworkImage(
      width: double.infinity,
      height: 180.h,
      bdRadius: 32,
      fit: BoxFit.cover,
      imageUrl:
          "https://softauthor.com/wp-content/uploads/2022/07/Google-Maps-API-Directions-Services-Example-Create-Map-Object-1024x526.png",
    );
  }

  // --- Styles & Helpers ---

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Colors.grey.shade100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  TextStyle _boldStyle(double size, {Color color = Colors.black}) {
    return AppTextStyles.bodyMedium.copyWith(
      fontSize: size.sp,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  TextStyle _greyStyle(double size) {
    return AppTextStyles.bodyMedium.copyWith(
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _buildDateChip(String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Color(0xFFD1E6FF),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(date, style: _boldStyle(12, color: AppColors.primary)),
    );
  }

  Widget _buildTimeChip(String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Color(0xFFFFF4D1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(time, style: _boldStyle(12, color: Color(0xFFB58900))),
    );
  }

  Widget _buildSmallChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String price, {
    bool isTotal = false,
    String? suffix,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (suffix != null)
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: label,

              style: isTotal ? _boldStyle(16) : _greyStyle(14),
              children: [
                TextSpan(
                  text: suffix,

                  style: _greyStyle(12).copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          )
        else
          Text(label, style: isTotal ? _boldStyle(16) : _greyStyle(14)),
        Text(price, style: isTotal ? _boldStyle(16) : _boldStyle(14)),
      ],
    );
  }

  Widget _buildStationInfo(
    String city,
    String station, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          city,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        4.hBox,
        Text(
          station,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
