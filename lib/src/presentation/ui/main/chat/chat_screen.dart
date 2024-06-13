import 'package:chat/src/controllers/main/chat/chat_controller.dart';
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
              const Expanded(child: NoMessagesItem()),
              AppUtils.secondaryDivider,
              InputField(
                controller: controller.messageController,
                hintText: 'Сообщение',
                margin: AppUtils.horizontal20Vertical10,
                suffixIcon: controller.messageController.text.isNotEmpty
                    ? Icons.send
                    : null,
                onSuffixTap: controller.send,
              ),
            ],
          );
        },
      ),
    );
  }
}
