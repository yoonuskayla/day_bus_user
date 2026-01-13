import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static const BoxDecoration mainGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.secondary, AppColors.secondary],
    ),
  );
}
