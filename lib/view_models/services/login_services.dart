import 'dart:async';
import 'package:get/get.dart';
import '../../res/routes/routes_name.dart';
import '../controller/user_preference/user_preference_view_model.dart';

class LoginServices extends GetxController {
  final userVM = Get.put(UserPreference());
  UserPreference userPreference = UserPreference();

  Future<void> isLogin() async {
    userPreference.getUser().then((user) {
      if (user.user == null && user.user!.eID!.isEmpty) {
        Timer(const Duration(milliseconds: 400),
            () => Get.toNamed(RoutesName.welcomeScreen));
      } else {
        Timer(const Duration(milliseconds: 400),
            () => Get.toNamed(RoutesName.navigationScreen));
      }
    }).onError((error, stackTrace) {
      Timer(const Duration(milliseconds: 400),
          () => Get.toNamed(RoutesName.welcomeScreen));
    });
  }
}
