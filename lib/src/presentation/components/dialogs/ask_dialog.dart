import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/presentation/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskDialog extends StatelessWidget {
  const AskDialog({
    super.key,
    required this.title,
    this.description,
    required this.onTap,
  });
  final String title;
  final String? description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      insetPadding: AppUtils.zeroPadding,
      backgroundColor: AppColors.white,
      contentPadding: AppUtils.allPadding16,
      shape: const RoundedRectangleBorder(
        borderRadius: AppUtils.allRadius24,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.w700.copyWith(color: AppColors.primaryText),
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                description!,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.tertiaryText,
                ),
              ),
            ),
          AppUtils.height24,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  color: Colors.transparent,
                  onTap: () => Get.back(),
                  text: 'Отмена',
                  textStyle: AppTextStyles.labelLarge,
                ),
              ),
              AppUtils.width12,
              Expanded(
                flex: 1,
                child: CustomButton(
                  onTap: () {
                    Get.back();
                    onTap();
                  },
                  text: 'Да',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
