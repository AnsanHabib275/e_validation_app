import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/reset_password_repository/reset_password_repository.dart';
import '../../../repository/update_profile_repository/update_profile_repository.dart';
import '../../../res/routes/routes_name.dart';

class UpdateProfileViewModel extends GetxController {
  final _api = UpdateProfileRepository();

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void updateProfileApi(String eid) {
    loading.value = true;
    Map data = {
      "E_ID": eid.toString(),
      "FirstName": firstNameController.value.text,
      "LastName": lastNameController.value.text,
      "MobileNumber": phoneNumberController.value.text,
      "DOB": "03-11-2001",
      "Gender": "Male",
    };
    _api.updateProfileApi(data).then((value) {
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
