import 'package:chat/src/controllers/auth/auth_controller.dart';
import 'package:chat/src/data/repositories/auth/auth_repositrory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthController(
        authRepository: AuthRepository(fireStore: FirebaseFirestore.instance),
      ),
    );
  }
}
