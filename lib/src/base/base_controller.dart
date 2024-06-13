import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/data/local_storage/local_storage.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final LocalStorage localStorage = LocalStorage();
  final UserModel? _user = LocalStorage().getUser();
  RxBool isLoading = false.obs;

  UserModel? get getUser => _user;

  void setLoading(bool value) {
    isLoading.value = value;
    update();
  }

  void showError(String message, {String title = 'Ошибка'}) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
        overflow: TextOverflow.ellipsis,
        maxLines: 6,
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
      ),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 12.0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      colorText: AppColors.white,
      backgroundColor: AppColors.lightRed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: const Duration(seconds: 2),
    );
    // }
  }

  void showSuccessSnackBar(String title, {String message = ''}) {
    Get.snackbar(
      title,
      message,
      titleText: Center(
        child: Row(
          children: [
            const Icon(
              Icons.check,
              color: AppColors.white,
              size: 30,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      messageText: const SizedBox(),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 12,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      colorText: AppColors.white,
      backgroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: const Duration(seconds: 2),
    );
  }

  void logOut() {
    Get.offAllNamed(AppRoutes.auth);
    LocalStorage.instance.setUser(null);
  }
}
