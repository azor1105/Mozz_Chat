import 'package:chat/src/controllers/main/chat/chat_controller.dart';
import 'package:chat/src/core/extensions/date_extensions.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/presentation/components/appbars/user_appbar.dart';
import 'package:chat/src/presentation/components/fields/input_field.dart';
import 'package:chat/src/presentation/ui/main/chat/widgets/message_item.dart';
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
                        padding: AppUtils.horizontal10,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          var message = controller.messages[index];
                          return MessageItem(
                            isUser: message.from == controller.getUser!.id,
                            showDate: index == 0 ||
                                message.dateTime.toDateTime
                                        .difference(controller
                                            .messages[index - 1]
                                            .dateTime
                                            .toDateTime)
                                        .inDays >
                                    0,
                            message: message,
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
                maxLines: null,
              ),
            ],
          );
        },
      ),
    );
  }
}
