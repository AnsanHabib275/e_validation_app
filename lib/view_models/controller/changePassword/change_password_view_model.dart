import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/change_password_repository/change_password_repository.dart';

class ChangePasswordViewModel extends GetxController {
  final _api = ChangePasswordRepository();

  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;

  final oldPasswordFocusNode = FocusNode().obs;
  final newPasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void changePasswordApi() {
    loading.value = true;
    Map data = {
      'OldPassword': oldPasswordController.value.text,
      'NewPassword': newPasswordController.value.text,
    };
    _api.changePasswordApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage('password_changed_successfully'.tr);
        Get.back();
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
