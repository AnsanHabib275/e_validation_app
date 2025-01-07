import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/reset_password_repository/reset_password_repository.dart';
import '../../../res/routes/routes_name.dart';

class ResetPasswordViewModel extends GetxController {
  final _api = ResetPasswordRepository();

  final resetCodeController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final resetCodeFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void resetPasswordApi(String e_id) {
    loading.value = true;
    Map data = {
      'E_id': e_id,
      'Otp': resetCodeController.value.text,
      'NewPassword': passwordController.value.text,
    };
    _api.resetPasswordApi(data).then((value) {
      loading.value = false;
      if (value['errorcode'] == 1023) {
        errorMessage.value = value['message'];
      } else if (value['errorcode'] == 3084) {
        errorMessage.value = 'email_verification_failed'.tr;
      } else if (value['errorcode'] == 3064) {
        errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage(value['Message']);
        Get.toNamed(RoutesName.loginScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
