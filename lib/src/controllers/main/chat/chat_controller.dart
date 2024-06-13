import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:chat/src/data/repositories/main/chat/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends BaseController {
  ChatController({required ChatRepository chatRepository})
      : _chatRepository = chatRepository;
  final ChatRepository _chatRepository;
  final UserModel receiver = Get.arguments as UserModel;

  late final ScrollController scrollController;
  late final TextEditingController messageController;

  @override
  void onInit() {
    scrollController = ScrollController();
    messageController = TextEditingController()
      ..addListener(() async {
        var message = messageController.text;
        if (message.isEmpty || message.length == 1) {
          await Future.delayed(const Duration(milliseconds: 150));
          update();
        }
      });
    super.onInit();
  }

  void send() {}

  @override
  void onClose() {
    scrollController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
