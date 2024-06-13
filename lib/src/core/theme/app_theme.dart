import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
    ),
    brightness: Brightness.light,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white,
    primarySwatch: AppColors.primarySwatch,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primarySwatch,
    ).copyWith(background: AppColors.white),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: AppUtils.topRadius24,
      ),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryText),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      shadowColor: AppColors.shadow,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
      ),
      titleTextStyle: AppTextStyles.labelMedium,
      iconTheme: const IconThemeData(color: AppColors.primaryText),
      actionsIconTheme: const IconThemeData(color: AppColors.primaryText),
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.black,
      ),
    ),
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    ),
  );
}
