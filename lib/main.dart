import 'dart:async';
import 'package:chat/firebase_options.dart';
import 'package:chat/src/bindings/splash/splash_binding.dart';
import 'package:chat/src/core/theme/app_theme.dart';
import 'package:chat/src/routes/app_pages.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Setting portrait view
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initializing Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Storage initialization
    await GetStorage.init();

    runApp(const MozzChatApp());
  }, (error, stack) {
    debugPrint(error.toString());
  });
}

class MozzChatApp extends StatelessWidget {
  const MozzChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.initial,
        initialBinding: SplashBinding(),
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
        onDispose: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        },
      ),
    );
  }
}

// dart run build_runner build --delete-conflicting-outputs