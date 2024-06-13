import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppBar extends StatelessWidget implements PreferredSize {
  const UserAppBar({
    super.key,
    required this.user,
    this.height,
  });
  final UserModel user;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(CupertinoIcons.back),
      ),
      title: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(user.color),
            ),
            child: Center(
              child: Text(
                user.login[0].toUpperCase(),
                style: AppTextStyles.w700,
              ),
            ),
          ),
          AppUtils.width12,
          Text(
            user.login,
            style: AppTextStyles.titleMedium,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);

  @override
  Widget get child => throw UnimplementedError();
}
