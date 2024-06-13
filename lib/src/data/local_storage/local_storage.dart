import 'package:get_storage/get_storage.dart';

class LocalStorage {
  LocalStorage._();

  static LocalStorage? _instance;

  static LocalStorage get instance => _instance ?? LocalStorage._();

  factory LocalStorage() => _instance ?? LocalStorage._();

  final _localStorage = GetStorage();


  // Implement these methods
  // Future<UserModel?> setUser(UserModel? user) async {
  //   await _localStorage.write(LocalStorageKeys.USER, user?.toJson());
  //   return user;
  // }

  // UserModel? getUser() {
  //   final user = _localStorage.read(LocalStorageKeys.USER);
  //   return user != null
  //       ? UserModel.fromJson(user as Map<String, dynamic>)
  //       : null;
  // }
}
