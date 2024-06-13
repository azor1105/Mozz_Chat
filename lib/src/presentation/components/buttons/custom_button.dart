import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final double? height;
  final EdgeInsets margin;
  final Color color;
  final Color? borderColor;
  final String? text;
  final RxBool? isLoading;
  final TextStyle? textStyle;
  final double? borderRadius;
  final AlignmentGeometry alignment;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final double? width;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.onTap,
    this.height = 54,
    this.child,
    this.text,
    this.isLoading,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 12,
    this.color = AppColors.primary,
    this.borderColor,
    this.alignment = Alignment.center,
    this.textStyle,
    this.foregroundColor,
    this.padding,
    this.width,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: Padding(
        padding: margin,
        child: ElevatedButton(
          onPressed: !(isLoading?.value ?? false) && !isDisabled ? onTap : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? AppColors.shadow,
            backgroundColor: color,
            disabledBackgroundColor: AppColors.primary.withOpacity(0.7),
            disabledForegroundColor: AppColors.primary.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            padding: padding,
          ).copyWith(
            elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return 0;
                return 0;
              },
            ),
          ),
          child: Container(
            height: height,
            alignment: alignment,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 12,
                  bottom: 12,
                  child: isLoading != null
                      ? Obx(
                          () => Visibility(
                            visible: (isLoading!.value),
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: child ??
                      Text(
                        text ?? '',
                        style: textStyle ??
                            AppTextStyles.labelLarge.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
