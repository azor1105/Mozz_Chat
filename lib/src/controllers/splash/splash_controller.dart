import 'package:chat/src/base/base_controller.dart';

class SplashController extends BaseController {
  SplashController();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 500, seconds: 1));
    // Later implement it
    // Get.offNamed(getUser == null ? AppRoutes.auth : AppRoutes.main);
  }
}
