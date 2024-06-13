import 'package:chat/src/core/constants/app_assets.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoMessagesItem extends StatelessWidget {
  const NoMessagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.noMessagesLottie,
          height: Get.height * 0.35,
        ),
        Text(
          "Пока нету сообщений",
          style: AppTextStyles.w700.copyWith(
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }
}
