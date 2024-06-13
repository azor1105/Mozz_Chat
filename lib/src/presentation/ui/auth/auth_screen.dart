import 'package:chat/src/controllers/auth/auth_controller.dart';
import 'package:chat/src/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(AppAssets.authLottie, height: Get.height * 0.3)
          ],
        ),
      ),
    );
  }
}
