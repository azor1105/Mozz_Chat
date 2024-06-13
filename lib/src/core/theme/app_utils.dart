import 'package:chat/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  // RADIUSES
  static const topRadius12 = BorderRadius.vertical(top: Radius.circular(12));
  static const allRadius8 = BorderRadius.all(Radius.circular(8));
  static const allRadius12 = BorderRadius.all(Radius.circular(12));
  static const topRadius24 = BorderRadius.vertical(top: Radius.circular(24));
  static const allRadius24 = BorderRadius.all(Radius.circular(24));

  // EDGE INSETS
  static const horizontal20 = EdgeInsets.symmetric(horizontal: 20);
  static const horizontal20Vertical10 =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const top16All24 =
      EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16);

  static const allPadding8 = EdgeInsets.all(8);
  static const allPadding12 = EdgeInsets.all(12);
  static const allPadding16 = EdgeInsets.all(16);
  static const allPadding24 = EdgeInsets.all(24);

  static const zeroPadding = EdgeInsets.zero;

  // HEIGHT BOXES
  static const height2 = SizedBox(height: 2);
  static const height4 = SizedBox(height: 4);
  static const height6 = SizedBox(height: 6);
  static const height8 = SizedBox(height: 8);
  static const height10 = SizedBox(height: 10);
  static const height12 = SizedBox(height: 12);
  static const height14 = SizedBox(height: 14);
  static const height16 = SizedBox(height: 16);
  static const height18 = SizedBox(height: 18);
  static const height20 = SizedBox(height: 20);
  static const height24 = SizedBox(height: 24);

  // WIDTH BOXES
  static const width2 = SizedBox(width: 2);
  static const width4 = SizedBox(width: 4);
  static const width6 = SizedBox(width: 6);
  static const width8 = SizedBox(width: 8);
  static const width10 = SizedBox(width: 10);
  static const width12 = SizedBox(width: 12);
  static const width14 = SizedBox(width: 14);
  static const width16 = SizedBox(width: 16);
  static const width18 = SizedBox(width: 18);
  static const width20 = SizedBox(width: 20);
  static const width22 = SizedBox(width: 22);
  static const width24 = SizedBox(width: 24);

  static const primaryDivider = Divider(height: 0);
  static const secondaryDivider = Divider(
    height: 1,
    color: AppColors.secondary,
    thickness: 1.5,
  );
  static const spacer = Spacer();
}
