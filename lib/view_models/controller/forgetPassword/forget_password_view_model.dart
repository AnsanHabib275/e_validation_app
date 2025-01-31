import 'package:e_validation/repository/forget_password_repository/forget_password_repository.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/signUp/sign_up_model.dart';
import '../../../repository/signup_repository/sign_up_repository.dart';
import '../../../repository/verify_email_repository/verify_email_repository.dart';
import '../../../res/routes/routes_name.dart';

class ForgetPasswordViewModel extends GetxController {
  final _api = ForgetPasswordRepository();

  final emailController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void forgetPasswordApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    _api.forgetPasswordApi(data).then((value) {
      loading.value = false;
      if (value['errorcode'] == 1006) {
        errorMessage.value = value['message'];
      } else if (value['errorcode'] == 3084) {
        errorMessage.value = 'email_verification_failed'.tr;
      } else if (value['errorcode'] == 3064) {
        errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage("Success");
        Get.toNamed(RoutesName.otpScreen, arguments: {
          'e_id': value['E_Id'],
        })!
            .then((value) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
