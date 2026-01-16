import 'package:day_bus_user/core/resources/app_images.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/core/widgets/app_network_image.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:day_bus_user/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:day_bus_user/features/profile/presentation/widgets/custom_selection_chip.dart';

class ScreenMyInformation extends StatefulWidget {
  const ScreenMyInformation({super.key});

  @override
  State<ScreenMyInformation> createState() => _ScreenMyInformationState();
}

class _ScreenMyInformationState extends State<ScreenMyInformation> {
  final TextEditingController _nameController = TextEditingController(
    text: "Megha Madhavan",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "9544264781",
  );
  final TextEditingController _dobController = TextEditingController(
    text: "29/10/2002",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "meghamadhavan@gmail.com",
  );

  String _selectedGender = "Female";

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "My Information"),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeaderSection(), _buildFormSection()]),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.profieEditBg),
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
              _buildChangePhotoButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChangePhotoButton() {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(9.r),
        color: AppColors.primary.withOpacity(0.6),
        strokeWidth: 1,
        dashPattern: const [6, 4],
        padding: EdgeInsets.zero,
      ),
      child: CustomButton(
        text: "Change Photo",
        onPressed: () {},
        height: 40.h,
        width: 110.w,
        isFullWidth: false,
        backgroundColor: const Color(0xFFD1E6FF),
        textColor: AppColors.primary,
        elevation: 0,
        padding: EdgeInsets.zero,
        textStyle: AppTextStyles.bodyMedium.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // Form Section
  Widget _buildFormSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.hBox,
          _buildSectionTitle("Your Informations"),
          15.hBox,
          _buildTextFields(),
          15.hBox,
          _buildGenderSelector(),
          40.hBox,
          CustomButton(text: "Save Changes", onPressed: () {}),
          40.hBox,
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyMedium.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildTextFields() {
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
            Icons.calendar_today_outlined,
            color: Colors.grey,
            size: 20.sp,
          ),
          onTap: () {
            // Date picker logic
          },
        ),
        15.hBox,
        CustomTextField(
          label: "E mail",
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
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
