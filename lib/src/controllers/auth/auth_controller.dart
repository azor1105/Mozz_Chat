import 'package:chat/src/base/base_controller.dart';

class AuthController extends BaseController {
  bool isLoginForm = true;

  void changeForm() {
    isLoginForm = !isLoginForm;
    update();
  }
}
