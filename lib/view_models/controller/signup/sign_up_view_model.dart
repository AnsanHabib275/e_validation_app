import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/signUp/sign_up_model.dart';
import '../../../repository/signup_repository/sign_up_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  // final genderController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;
  final dateOfBirthFocusNode = FocusNode().obs;
  // final genderFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isEnable = false.obs;
  RxString errorMessage = ''.obs;

  void signUpApi() {
    loading.value = true;
    Map data = {
      'FirstName': firstNameController.value.text,
      'LastName': lastNameController.value.text,
      'email': emailController.value.text,
      'PhoneNumber': countryCodeController.value.text +
          '' +
          phoneNumberController.value.text,
      'DOB': dateOfBirthController.value.text,
      // 'Gender': genderController.value.text,
      'password': passwordController.value.text,
    };
    print(data);
    _api.signUpApi(data).then((value) {
      loading.value = false;
      if (value['errorcode'] == 1002) {
        errorMessage.value = 'email_already_exists'.tr;
      } else if (value['errorcode'] == 1003) {
        errorMessage.value = 'email_verification_failed'.tr;
      } else if (value['errorcode'] == 1004) {
        errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage("Success");
        Get.toNamed(RoutesName.otpScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
