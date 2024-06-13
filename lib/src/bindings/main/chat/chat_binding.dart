import 'package:chat/src/controllers/main/chat/chat_controller.dart';
import 'package:chat/src/data/repositories/main/chat/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChatController(
        chatRepository: ChatRepository(firestrore: FirebaseFirestore.instance),
      ),
    );
  }
}
