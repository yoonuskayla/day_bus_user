import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {
  Widget get hBox => SizedBox(height: toDouble().h);
  Widget get wBox => SizedBox(width: toDouble().w);
}

extension PaddingExt on num {
  EdgeInsets get pAll => EdgeInsets.all(toDouble().w);
  EdgeInsets get pVertical => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get pHorizontal => EdgeInsets.symmetric(horizontal: toDouble().w);
}

extension MediaQuerySize on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}
