import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/localization/languages.dart';
import 'package:e_validation/res/routes/routes.dart';
import 'package:e_validation/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_title'.tr,
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColor.colorPrimary,
            ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
