import 'package:chat/src/controllers/splash/splash_controller.dart';
import 'package:chat/src/core/constants/app_assets.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                width: double.infinity,
                AppAssets.splashLottie,
                height: Get.height * 0.42,
              ),
              const Text(
                "Mozz Chat",
                style: AppTextStyles.titleLarge,
              ),
            ],
          );
        },
      ),
    );
  }
}
