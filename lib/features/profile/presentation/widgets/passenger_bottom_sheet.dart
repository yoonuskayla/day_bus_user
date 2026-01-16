import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/core/widgets/custom_textfield.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/custom_selection_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PassengerBottomSheet extends StatefulWidget {
  final Map<String, dynamic>? passenger;
  final VoidCallback onSave;

  const PassengerBottomSheet({super.key, this.passenger, required this.onSave});

  @override
  State<PassengerBottomSheet> createState() => _PassengerBottomSheetState();
}

class _PassengerBottomSheetState extends State<PassengerBottomSheet> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _dobController;
  late TextEditingController _emailController;

  String _selectedGender = "Female";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.passenger?['name'] ?? 'Yoonus',
    );
    _phoneController = TextEditingController(text: "9544264781");
    _dobController = TextEditingController(text: "29/10/2002");
    _emailController = TextEditingController(text: "meghamadhavan@gmail.com");
    _selectedGender = widget.passenger?['gender'] ?? "Female";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 25.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildHeaderText(), 20.hBox, _buildFormFields()],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 26.w,
          top: -20.h,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 3),
              ),
              child: Icon(Icons.close, color: Colors.black, size: 24.sp),
            ),
          ),
        ),
      ],
    );
  }

  // Header Title
  Widget _buildHeaderText() {
    return Text(
      widget.passenger != null
          ? "Edit Passanger's Details"
          : "Add New Passanger",
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Form Fields
  Widget _buildFormFields() {
    return Column(
      children: [
        CustomTextField(label: "Name", controller: _nameController),
        15.hBox,
        CustomTextField(
          label: "Phone Number",
          controller: _phoneController,
          keyboardType: TextInputType.phone,
        ),
        15.hBox,
        CustomTextField(
          label: "Date of Birth",
          controller: _dobController,
          readOnly: true,
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Colors.grey,
            size: 20.sp,
          ),
        ),
        15.hBox,
        CustomTextField(
          label: "E mail",
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        15.hBox,
        _buildGenderSelector(),
        30.hBox,
        CustomButton(text: "Save changes", onPressed: widget.onSave),
        20.hBox,
      ],
    );
  }

  // Gender Selection
  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: AppTextStyles.bodyMedium.copyWith(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        10.hBox,
        Row(
          children: [
            _buildGenderOption("Male"),
            10.wBox,
            _buildGenderOption("Female"),
            10.wBox,
            _buildGenderOption("Other"),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String gender) {
    final isSelected = _selectedGender == gender;
    return CustomSelectionChip(
      text: gender,
      isSelected: isSelected,
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
    );
  }
}
