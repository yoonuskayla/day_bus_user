import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
  List<Widget> actions = const [],
  bool isBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    leading: isBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => context.pop(),
          )
        : null,
    automaticallyImplyLeading: isBackButton,
    title: Text(
      title,
      style: AppTextStyles.h1.copyWith(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    ),
    actions: actions,
  );
}
