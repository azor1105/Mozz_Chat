import 'package:chat/src/controllers/main/main_controller.dart';
import 'package:chat/src/data/repositories/main/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainController(
        userRepository: UserRepository(firestore: FirebaseFirestore.instance),
      ),
      fenix: true,
    );
  }
}
