import 'package:chat/src/controllers/auth/auth_controller.dart';
import 'package:chat/src/core/constants/app_assets.dart';
import 'package:chat/src/core/constants/app_constants.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/presentation/components/buttons/custom_button.dart';
import 'package:chat/src/presentation/components/fields/input_field.dart';
import 'package:chat/src/presentation/components/fields/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        bool isLogin = controller.isLoginForm;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: AppUtils.horizontal20,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    Center(
                      child: Lottie.asset(
                        AppAssets.authLottie,
                        height: Get.height * 0.25,
                        reverse: true,
                      ),
                    ),
                    AppUtils.height10,
                    Center(
                      child: Text(
                        "Войти",
                        style: AppTextStyles.titleLarge.copyWith(fontSize: 28),
                      ),
                    ),
                    AppUtils.height20,
                    AnimatedSize(
                      duration: AppConstants.animationDuration,
                      child: Column(
                        children: [
                          InputField(
                            hintText: 'Логин',
                            controller: controller.loginController,
                            focusNode: controller.loginFocus,
                            onSubmitted: (v) {
                              FocusScope.of(context).requestFocus(
                                controller.passFocus,
                              );
                            },
                          ),
                          AppUtils.height12,
                          PasswordField(
                            hintText: 'Пароль',
                            controller: controller.passController,
                            focusNode: controller.passFocus,
                            onSubmitted: (v) {
                              if (!isLogin) {
                                FocusScope.of(context).requestFocus(
                                  controller.confirmPassFocus,
                                );
                              }
                            },
                          ),
                          if (!isLogin) ...[
                            AppUtils.height12,
                            PasswordField(
                              hintText: 'Потвердить пароль',
                              controller: controller.confirmPassController,
                              focusNode: controller.confirmPassFocus,
                            ),
                          ],
                        ],
                      ),
                    ),
                    AppUtils.height6,
                    TextButton(
                      onPressed: controller.changeForm,
                      child: Text(
                        isLogin
                            ? "Нету аккаунта? Регистрция"
                            : "У вас уже есть аккаунт? Войти",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: AppUtils.horizontal20Vertical16,
              child: CustomButton(
                onTap: isLogin ? controller.login : controller.register,
                isLoading: controller.isLoading,
                text: isLogin ? 'Войти' : "Регистрировать",
              ),
            ),
          ),
        );
      },
    );
  }
}
