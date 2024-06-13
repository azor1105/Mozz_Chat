import 'package:chat/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle mainUserMessageStyle = TextStyle(
    color: AppColors.primaryDark,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle secBodyMedium = TextStyle(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle labelSmall = TextStyle(
    color: AppColors.secondaryText,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const TextStyle labelMedium = TextStyle(
    color: AppColors.tertiaryText,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle labelLarge = TextStyle(
    color: AppColors.tertiaryText,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle titleSmall = TextStyle(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32,
  );
}
