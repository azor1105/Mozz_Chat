import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user,
    required this.onTap,
  });
  final UserModel user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: AppUtils.horizontal20Vertical10,
          leading: Container(
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
          title: Text(
            user.login,
            style: AppTextStyles.titleMedium,
          ),
        ),
        const Padding(
          padding: AppUtils.horizontal20,
          child: AppUtils.primaryDivider,
        ),
      ],
    );
  }
}
