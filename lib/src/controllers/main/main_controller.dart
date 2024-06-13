import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/data/repositories/main/user_repository.dart';

class MainController extends BaseController {
  MainController({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;
}
