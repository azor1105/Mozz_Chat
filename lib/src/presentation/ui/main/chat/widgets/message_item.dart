import 'package:chat/src/core/extensions/date_extensions.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/data/models/message/message_model.dart';
import 'package:chat/src/presentation/ui/main/chat/widgets/date_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.isUser,
    required this.showDate,
    required this.message,
  });

  final MessageModel message;
  final bool isUser;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          !isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (showDate) DateItem(dateTime: message.dateTime),
        SizedBox(
          width: Get.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(
              crossAxisAlignment:
                  !isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: AppUtils.allPadding12,
                  decoration: BoxDecoration(
                    color: isUser ? AppColors.primary : AppColors.secondary,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Column(
                    children: [
                      SelectableText(
                        message.text,
                        style: isUser
                            ? AppTextStyles.mainUserMessageStyle
                            : AppTextStyles.secBodyMedium,
                      ),
                    ],
                  ),
                ),
                AppUtils.height2,
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    message.dateTime.formatToHour,
                    style: isUser
                        ? AppTextStyles.mainUserMessageStyle
                            .copyWith(fontSize: 12)
                        : AppTextStyles.secBodyMedium.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// AppUtils.width12,
