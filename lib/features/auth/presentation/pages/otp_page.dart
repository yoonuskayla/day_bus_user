import 'package:day_bus_user/core/routes/app_router.dart';
import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:day_bus_user/core/theme/app_decorations.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({super.key});

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default theme for Pinput
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: AppTextStyles.h1.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.mainGradient,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListView(
              children: [
                250.hBox,
                Text(
                  "Enter OTP",
                  style: AppTextStyles.h1.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 30.sp,
                    letterSpacing: -.3,
                    fontFamily: "Inter",
                  ),
                ),
                0.hBox,
                RichText(
                  text: TextSpan(
                    text:
                        "We've sent a 4-digit code to your number +91 XXXXX ${3210} ",
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 11.sp),
                    children: [
                      TextSpan(
                        text: "Edit",
                        style: const TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
                32.hBox,
                Pinput(
                  controller: _otpController,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                32.hBox,
                CustomButton(
                  text: "Send OTP",
                  onPressed: () {
                    context.push(AppRouter.bottomNavBar);
                  },
                ),
                24.hBox,
                Center(
                  child: Text(
                    "30 second",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.black,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                10.hBox,

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't recive code ?  ",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Recent OTP",
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w400,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
