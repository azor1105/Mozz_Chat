import 'package:chat/src/controllers/main/chat/chat_controller.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/presentation/components/appbars/user_appbar.dart';
import 'package:chat/src/presentation/components/fields/input_field.dart';
import 'package:chat/src/presentation/ui/main/chat/widgets/no_messages_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(user: controller.receiver),
      body: GetBuilder<ChatController>(
        builder: (controller) {
          return Column(
            children: [
              AppUtils.secondaryDivider,
              Expanded(
                child: controller.messages.isEmpty
                    ? const NoMessagesItem()
                    : ListView.builder(
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          var message = controller.messages[index];
                          return Text(
                            message.text,
                            style: AppTextStyles.titleLarge.copyWith(
                              color: AppColors.black,
                            ),
                          );
                        },
                        itemCount: controller.messages.length,
                      ),
              ),
              AppUtils.secondaryDivider,
              InputField(
                controller: controller.messageController,
                focusNode: controller.messageFocus,
                hintText: 'Сообщение',
                margin: AppUtils.horizontal20Vertical10,
                suffixIcon:
                    controller.getMessageText.isNotEmpty ? Icons.send : null,
                onSuffixTap: controller.send,
              ),
            ],
          );
        },
      ),
    );
  }
}
