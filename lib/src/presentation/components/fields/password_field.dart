import 'package:chat/src/core/constants/app_assets.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.margin,
    this.contentPadding,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
  });

  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: TextField(
        obscureText: obscureText,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: AppTextStyles.titleSmall.copyWith(fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => setState(
              () => obscureText = !obscureText,
            ),
            icon: SvgPicture.asset(
              obscureText ? AppAssets.hideIcon : AppAssets.showIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.black,
                BlendMode.srcIn,
              ),
              height: 18,
            ),
          ),
          contentPadding: AppUtils.allPadding12,
          hintStyle: AppTextStyles.labelLarge,
          hintText: widget.hintText,
          fillColor: AppColors.secondary,
          filled: true,
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
        ),
        cursorColor: AppColors.primary,
      ),
    );
  }
}
