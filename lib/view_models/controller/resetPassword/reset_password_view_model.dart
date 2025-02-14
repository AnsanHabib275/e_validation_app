import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/reset_password_repository/reset_password_repository.dart';
import '../../../res/routes/routes_name.dart';

class ResetPasswordViewModel extends GetxController {
  final _api = ResetPasswordRepository();

  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final newPasswordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void resetPasswordApi(String e_id) {
    loading.value = true;
    Map data = {
      'E_id': e_id,
      'NewPassword': newPasswordController.value.text,
    };
    _api.resetPasswordApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage('PASSWORD RESET SUCCESSFULLY');
        Get.toNamed(RoutesName.loginScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
