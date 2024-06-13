import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  SplashController();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 500, seconds: 1));
    Get.offNamed(getUser == null ? AppRoutes.auth : AppRoutes.main);
  }
}
