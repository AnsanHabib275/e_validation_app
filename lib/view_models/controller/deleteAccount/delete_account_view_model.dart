import 'package:e_validation/repository/delete_account_repository/delete_account_repository.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/change_password_repository/change_password_repository.dart';
import '../../../res/routes/routes_name.dart';

class DeleteAccountViewModel extends GetxController {
  final _api = DeleteAccountRepository();

  final emailController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;
  UserPreference userPreference = UserPreference();

  void deleteAccountApi(String e_id) {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    _api.deleteAccountApi(data, e_id).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
        // } else if (value['errorcode'] == 3084) {
        //   errorMessage.value = 'email_verification_failed'.tr;
        // } else if (value['errorcode'] == 3064) {
        //   errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage('Account Deleted');
        userPreference.removeUser();
        Get.offAllNamed(RoutesName.loginScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
