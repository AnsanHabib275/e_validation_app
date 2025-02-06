import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/login/login_model.dart';
import '../../../repository/login_repository/login_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool rememberMe = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  UserPreference userPreference = UserPreference();

  setRememberMe(bool value) {
    rememberMe.value = value;
  }

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
        // } else if (value['errorcode'] == 1017) {
        //   errorMessage.value = 'invalid_credentials'.tr;
        // } else if (value['errorcode'] == 1018) {
        //   errorMessage.value = 'invalid_credentials'.tr;
      } else {
        // Utils.toastMessage("Success");
        // Get.toNamed(RoutesName.navigationScreen);
        errorMessage.value = '';
        LoginModel loginModel = LoginModel.fromJson(value);
        userPreference.saveUser(loginModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesName.navigationScreen);
        }).onError((error, stackTrace) {
          errorMessage.value = error.toString();
        });
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
