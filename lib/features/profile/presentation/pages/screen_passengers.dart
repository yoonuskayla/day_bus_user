import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/passenger_bottom_sheet.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/passenger_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenPassengers extends StatefulWidget {
  const ScreenPassengers({super.key});

  @override
  State<ScreenPassengers> createState() => _ScreenPassengersState();
}

class _ScreenPassengersState extends State<ScreenPassengers> {
  final List<Map<String, dynamic>> _passengers = [
    {
      "name": "Megha Madhavan",
      "gender": "Female",
      "age": 23,
      "isSelected": false,
    },
    {"name": "Madhavan.P", "gender": "Male", "age": 45, "isSelected": false},
    {"name": "Indira", "gender": "Female", "age": 40, "isSelected": false},
    {"name": "Shibil.K", "gender": "Male", "age": 22, "isSelected": false},
    {"name": "Vishnu.P", "gender": "Male", "age": 24, "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    bool isSelectionMode = _passengers.any((p) => p['isSelected'] == true);
    int selectedCount = _passengers
        .where((p) => p['isSelected'] == true)
        .length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "Passangers"),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              itemCount: _passengers.length,
              separatorBuilder: (context, index) => 15.hBox,
              itemBuilder: (context, index) {
                final passenger = _passengers[index];
                return _buildPassengerCard(passenger, index, isSelectionMode);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: CustomButton(
              text: isSelectionMode
                  ? "Delete User ($selectedCount)"
                  : "Add New Passanger",
              backgroundColor: isSelectionMode ? Colors.red : AppColors.primary,
              onPressed: () {
                if (isSelectionMode) {
                  // Handle multiple delete
                  setState(() {
                    _passengers.removeWhere((p) => p['isSelected'] == true);
                  });
                } else {
                  _showPassengerBottomSheet(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerCard(
    Map<String, dynamic> passenger,
    int index,
    bool isSelectionMode,
  ) {
    return PassengerCard(
      passenger: passenger,
      isSelectionMode: isSelectionMode,
      onTap: () {
        setState(() {
          passenger['isSelected'] = !passenger['isSelected'];
        });
      },
      onLongPress: () {
        if (!isSelectionMode) {
          HapticFeedback.heavyImpact();
          setState(() {
            passenger['isSelected'] = true;
          });
        }
      },
      onEdit: () {
        _showPassengerBottomSheet(context, passenger: passenger);
      },
      onDelete: () {
        setState(() {
          _passengers.removeAt(index);
        });
      },
    );
  }

  void _showPassengerBottomSheet(
    BuildContext context, {
    Map<String, dynamic>? passenger,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: PassengerBottomSheet(
          passenger: passenger,
          onSave: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
