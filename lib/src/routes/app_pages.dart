import 'package:chat/src/bindings/auth/auth_binding.dart';
import 'package:chat/src/bindings/main/main_binding.dart';
import 'package:chat/src/bindings/splash/splash_binding.dart';
import 'package:chat/src/presentation/ui/auth/auth_screen.dart';
import 'package:chat/src/presentation/ui/main/main_screen.dart';
import 'package:chat/src/presentation/ui/splash/splash_screen.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}
