import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool? showError;
  final TextEditingController? controller;
  final bool? autoFocus;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final TextInputType? keyboardType;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final Color? fillColor;
  final EdgeInsets? margin;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const InputField({
    super.key,
    this.onSubmitted,
    this.showError = false,
    this.controller,
    this.autoFocus,
    this.onChanged,
    this.keyboardType,
    this.errorText,
    this.inputAction,
    this.focusNode,
    this.fillColor,
    this.margin,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? AppUtils.zeroPadding,
      child: TextField(
        style: AppTextStyles.titleSmall.copyWith(fontSize: 16),
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        textInputAction: inputAction,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: AppUtils.allPadding12,
          hintStyle: AppTextStyles.labelLarge,
          hintText: hintText,
          fillColor: fillColor ?? AppColors.secondary,
          filled: true,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: AppColors.tertiaryText,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onSuffixTap,
                  icon: Icon(
                    suffixIcon,
                    color: AppColors.tertiaryText,
                  ),
                )
              : null,
          focusedBorder: const OutlineInputBorder(
            borderRadius: AppUtils.allRadius12,
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.primary,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.secondary,
            ),
            borderRadius: AppUtils.allRadius12,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightRed, width: 1.5),
            borderRadius: AppUtils.allRadius12,
          ),
          errorText: showError ?? false ? errorText : null,
        ),
        cursorColor: AppColors.primary,
      ),
    );
  }
}
