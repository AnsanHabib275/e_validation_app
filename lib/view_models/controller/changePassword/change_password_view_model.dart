import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/change_password_repository/change_password_repository.dart';
import '../../../res/routes/routes_name.dart';

class ChangePasswordViewModel extends GetxController {
  final _api = ChangePasswordRepository();

  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;

  final oldPasswordFocusNode = FocusNode().obs;
  final newPasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void changePasswordApi(String e_id) {
    loading.value = true;
    Map data = {
      'OldPassword': oldPasswordController.value.text,
      'NewPassword': newPasswordController.value.text,
    };
    _api.changePasswordApi(data, e_id).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
        // } else if (value['errorcode'] == 3084) {
        //   errorMessage.value = 'email_verification_failed'.tr;
        // } else if (value['errorcode'] == 3064) {
        //   errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage(value['message']);
        Get.back();
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
