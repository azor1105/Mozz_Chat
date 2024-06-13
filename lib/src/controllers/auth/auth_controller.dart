import 'dart:async';

import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/data/repositories/auth/auth_repositrory.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends BaseController {
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  bool isLoginForm = true;
  final TextEditingController loginController = TextEditingController();
  final FocusNode loginFocus = FocusNode();

  final TextEditingController passController = TextEditingController();
  final FocusNode passFocus = FocusNode();

  final TextEditingController confirmPassController = TextEditingController();
  final FocusNode confirmPassFocus = FocusNode();

  void changeForm() {
    isLoginForm = !isLoginForm;
    loginController.clear();
    passController.clear();
    confirmPassController.clear();
    update();
  }

  @override
  void dispose() {
    loginController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    confirmPassFocus.dispose();
    passFocus.dispose();
    loginFocus.dispose();
    super.dispose();
  }

  Future<void> login() async {
    bool validation = validate();
    if (!validation) return;
    setLoading(true);
    var user = await _authRepository.getUserByLogin(getLogin);
    if (user == null) {
      showError('Этот пользователь не зарегистрирован');
    } else if (getPass != user.password) {
      showError('Логин или пароль неверный');
    } else {
      await localStorage.setUser(user);
      Get.offNamed(AppRoutes.main);
    }
    setLoading(false);
  }

  Future<void> register() async {
    bool validation = validate();
    if (!validation) return;
    setLoading(true);
    var isExistsUser = await _authRepository.getUserByLogin(getLogin) != null;
    if (isExistsUser) {
      showError('Этот пользователь уже существует');
    } else {
      var user = await _authRepository.register(
        login: getLogin,
        password: getPass,
      );
      await localStorage.setUser(user);
      Get.offNamed(AppRoutes.main);
    }
    setLoading(false);
  }

  bool validate() {
    if (getLogin.isEmpty) {
      showError("Заполните логин");
      return false;
    } else if (getPass.isEmpty) {
      showError("Заполните пароль");
      return false;
    } else if (!isLoginForm &&
        (getConfirmPass.isEmpty || getPass != getConfirmPass)) {
      showError("Пароли не совпадают");
      return false;
    }
    return true;
  }

  String get getLogin => loginController.text.trim();
  String get getPass => passController.text.trim();
  String get getConfirmPass => confirmPassController.text.trim();
}
