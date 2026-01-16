import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScreenSelectSeats extends StatefulWidget {
  const ScreenSelectSeats({super.key});

  @override
  State<ScreenSelectSeats> createState() => _ScreenSelectSeatsState();
}

class _ScreenSelectSeatsState extends State<ScreenSelectSeats> {
  // Mock Data: 0=Available, 1=Booked, 2=Selected, 3=Women, 4=Sold/Hold
  // Layout: 1 + 2
  // We'll generate some rows
  final int _rows = 10;
  final Set<String> _selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "Select Seats"),
      bottomNavigationBar: _buildBottomSummary(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrollable Seat Layout
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Row(
                children: [
                  _buildBusLayout(isHorizontal: false),
                  20.wBox,
                  _buildBusLayout(isHorizontal: false, showDriver: false),
                ],
              ),
            ),

            // Legend
            _buildLegend(),

            // Bus Info
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6F9),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gulf motors Private Limited",
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        4.hBox,
                        Text(
                          "18:30 - 20:35  |  wed,12 Nov  |  KL 55 C 3278",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.hBox,
          ],
        ),
      ),
    );
  }

  Widget _buildBusLayout({bool isHorizontal = false, bool showDriver = true}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: isHorizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Horizontal Bus Layout: Row of Columns
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_rows, (rowIndex) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: rowIndex == _rows - 1 ? 0 : 20.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _buildSeat(rowIndex, 2, "C"),
                                  20.wBox,
                                  _buildSeat(rowIndex, 1, "B"),
                                ],
                              ),
                              40.hBox,
                              _buildSeat(rowIndex, 0, "A"),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                30.wBox,
                Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: showDriver ? 1.0 : 0.0,
                    child: SvgPicture.asset(
                      AppImages.steeringWheel,
                      height: 40.w,
                      width: 40.w,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                // Driver Icon Area
                Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: showDriver ? 1.0 : 0.0,
                    child: SvgPicture.asset(
                      AppImages.steeringWheel,
                      height: 40.w,
                      width: 40.w,
                    ),
                  ), // Placeholder
                ),
                30.hBox,

                // Seats (1 + 2 Layout) - Vertical Bus Layout: Column of Rows
                Column(
                  children: List.generate(_rows, (rowIndex) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: rowIndex == _rows - 1 ? 0 : 20.h,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Side (1 Seat)
                          _buildSeat(rowIndex, 0, "A"),

                          // Aisle Gap
                          40.wBox, // Adjust as needed based on logic
                          // Right Side (2 Seats)
                          Row(
                            children: [
                              _buildSeat(rowIndex, 1, "B"),
                              20.wBox,
                              _buildSeat(rowIndex, 2, "C"),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                30.hBox,
              ],
            ),
    );
  }

  Widget _buildSeat(int rowIndex, int colIndex, String colLabel) {
    final seatId = "${rowIndex + 1}$colLabel";
    // Mock status logic
    bool isBooked = (rowIndex + colIndex) % 7 == 0;
    bool isWomen = (rowIndex + colIndex) % 5 == 0;
    bool isSelected = _selectedSeats.contains(seatId);

    // Status Logic
    SeatStatus status = SeatStatus.available;
    if (isBooked)
      status = SeatStatus.booked;
    else if (isWomen)
      status = SeatStatus.women;
    else if (isSelected)
      status = SeatStatus.selected;

    return GestureDetector(
      onTap: () {
        if (status == SeatStatus.booked || status == SeatStatus.women) return;
        HapticFeedback.lightImpact();
        setState(() {
          if (isSelected) {
            _selectedSeats.remove(seatId);
          } else {
            _selectedSeats.add(seatId);
          }
        });
      },
      child: SeatWidget(
        status: status,
        label: isBooked ? "Sold" : "₹200",
        // icon: We will add icon later
      ),
    );
  }

  // --- Legend ---
  Widget _buildLegend() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Wrap(
        spacing: 16.w,
        runSpacing: 10.h,
        children: [
          _buildLegendItem(
            AppColors.primary,
            "Available",
          ), // TODO: Fix color mapping
          _buildLegendItem(Colors.grey.shade300, "Booked"),
          _buildLegendItem(Colors.orange, "Holded"),
          _buildLegendItem(Colors.pinkAccent, "Reservation for Womens"),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        8.wBox,
        Text(label, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12.sp)),
      ],
    );
  }

  // --- Bottom Summary ---
  Widget _buildBottomSummary() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Price & Button
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹${_selectedSeats.length * 200}",
                    style: AppTextStyles.h1.copyWith(fontSize: 24.sp),
                  ),
                  Text(
                    "${_selectedSeats.length} Seat(s)",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ],
              ),
              20.wBox,
              Expanded(
                child: CustomButton(
                  text: "Choose Boarding & Drop",
                  onPressed: () {
                    // Navigate to next
                  },
                  textStyle: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.white,
                  ),
                  height: 50.h,
                  borderRadius: 25.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Seat Widget
// ---------------------------------------------------------------------------
enum SeatStatus { available, booked, selected, women, hold }

class SeatWidget extends StatelessWidget {
  final SeatStatus status;
  final String label;

  const SeatWidget({super.key, required this.status, required this.label});

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    Color cushionColor;
    Color contentColor;

    switch (status) {
      case SeatStatus.available:
        seatColor = const Color(0xFFE8F5E9); // Light Green
        cushionColor = const Color(0xFFA5D6A7);
        contentColor = Colors.green.shade800;
        break;
      case SeatStatus.booked:
        seatColor = const Color(0xFFF5F5F5); // Grey
        cushionColor = const Color(0xFFE0E0E0);
        contentColor = Colors.grey;
        break;
      case SeatStatus.selected:
        seatColor = AppColors.primary; // Blue (using primary)
        cushionColor = const Color(0xFF1565C0);
        contentColor = Colors.white;
        break;
      case SeatStatus.women:
        seatColor = const Color(0xFFFCE4EC); // Pink
        cushionColor = const Color(0xFFF48FB1);
        contentColor = Colors.pink;
        break;
      case SeatStatus.hold:
        seatColor = const Color(0xFFFFF3E0); // Orange
        cushionColor = const Color(0xFFFFCC80);
        contentColor = Colors.orange;
        break;
    }

    return Container(
      height: 60.h, // Adjusted height (increased)
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: seatColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Bottom Cushion (Simulated)
          Positioned(
            left: 0,
            right: 0,
            bottom: -5.h,
            height: 15.h,
            child: Container(
              decoration: BoxDecoration(
                color: cushionColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          // Price/Label Text inside top
          Positioned(
            top: 4.h,
            left: 0,
            right: 0,
            child: Center(
              child: status != SeatStatus.booked
                  ? Text(
                      label,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: status == SeatStatus.selected
                            ? Colors.white
                            : status == SeatStatus.women
                            ? Colors.pink
                            : Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Sold",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
            ),
          ),
          // Icon
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h), // Push icon down slightly
              child: SvgPicture.asset(
                status == SeatStatus.women ? AppImages.woman : AppImages.man,
                height: 20.w,
                width: 20.w,
                colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
