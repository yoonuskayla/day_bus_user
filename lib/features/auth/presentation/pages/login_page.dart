import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:day_bus_user/core/theme/app_decorations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Let's get you in!",
                  style: AppTextStyles.h1.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 30.sp,
                    letterSpacing: -.3,
                    fontFamily: "Inter",
                  ),
                ),
                Text(
                  "Login to continue your journey with Day Bus.",
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 12.sp),
                ),
                24.hBox,
                //  Login Form
                LoginForm(),
                18.hBox,
                Center(
                  child: Text(
                    "we'll send you an SMS for verification",
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 12.sp),
                  ),
                ),
                220.hBox,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 11.sp,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: "if your creating a new Account, ",
                        ),
                        TextSpan(
                          text: "Terms & conditions",
                          style: const TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: "\nand "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: " Will apply."),
                      ],
                    ),
                  ),
                ),
                16.hBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
