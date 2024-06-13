import 'dart:async';

import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/data/models/message/message_model.dart';
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
  late final FocusNode messageFocus;

  late final StreamSubscription _streamSubscription;
  List<MessageModel> messages = [];

  @override
  void onInit() {
    getMessages();
    scrollController = ScrollController();
    messageController = TextEditingController()
      ..addListener(() async {
        if (getMessageText.isEmpty || getMessageText.length == 1) {
          await Future.delayed(const Duration(milliseconds: 150));
          update();
        }
      });
    messageFocus = FocusNode();
    super.onInit();
  }

  void getMessages() {
    _streamSubscription =
        _chatRepository.getMessages(from: getUser!.id, to: receiver.id).listen(
      (event) {
        messages = event;
        update();
      },
    );
  }

  Future<void> send() async {
    _chatRepository.addMessage(
      message: MessageModel(
        id: 'LATER',
        from: getUser!.id,
        to: receiver.id,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        text: getMessageText,
        address: '${getUser!.id}|${receiver.id}',
      ),
    );
    messageController.clear();
    messageFocus.unfocus();
  }

  String get getMessageText => messageController.text.trim();

  @override
  void onClose() {
    messageFocus.dispose();
    scrollController.dispose();
    messageController.dispose();
    _streamSubscription.cancel();
    super.onClose();
  }
}
