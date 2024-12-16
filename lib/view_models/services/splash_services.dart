import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      // if (value.isLogin == false || value.isLogin.toString() == 'null') {
      // if (value.token!.isEmpty || value.token.toString() == 'null') {
      //   Timer(const Duration(seconds: 3),
      //       () => Get.toNamed(RoutesName.splashScreenTwo));
      // } else {
      //   Timer(const Duration(seconds: 3),
      //       () => Get.toNamed(RoutesName.navigationScreen));
      // }
    });
  }
}
