import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/signUp/sign_up_model.dart';
import '../../../repository/signup_repository/sign_up_repository.dart';
import '../../../repository/verify_email_repository/verify_email_repository.dart';
import '../../../res/routes/routes_name.dart';

class VerifyEmailViewModel extends GetxController {
  final _api = VerifyEmailRepository();

  final codeController = TextEditingController().obs;

  final codeFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void verifyEmailApi() {
    loading.value = true;
    Map data = {
      'code': codeController.value.text,
    };
    _api.verifyEmailApi(data).then((value) {
      loading.value = false;
      if (value['errorcode'] == 1006) {
        errorMessage.value = value['message'];
      } else if (value['errorcode'] == 3084) {
        errorMessage.value = 'email_verification_failed'.tr;
      } else if (value['errorcode'] == 3064) {
        errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage("Success");
        Get.toNamed(RoutesName.accountCreatedScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
