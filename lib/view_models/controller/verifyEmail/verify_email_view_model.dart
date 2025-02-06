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

  final otpOneController = TextEditingController().obs;
  final otpTwoController = TextEditingController().obs;
  final otpThreeController = TextEditingController().obs;
  final otpFourController = TextEditingController().obs;
  final otpFiveController = TextEditingController().obs;
  final otpSixController = TextEditingController().obs;

  final otpOneFocusNode = FocusNode().obs;
  final otpTwoFocusNode = FocusNode().obs;
  final otpThreeFocusNode = FocusNode().obs;
  final otpFourFocusNode = FocusNode().obs;
  final otpFiveFocusNode = FocusNode().obs;
  final otpSixFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;
  RxString from = ''.obs;

  void checkOtpFilled() {
    if (otpOneController.value.text.isNotEmpty &&
        otpTwoController.value.text.isNotEmpty &&
        otpThreeController.value.text.isNotEmpty &&
        otpFourController.value.text.isNotEmpty &&
        otpFiveController.value.text.isNotEmpty &&
        otpSixController.value.text.isNotEmpty) {
      verifyEmailApi();
    }
  }

  void verifyEmailApi() {
    loading.value = true;
    final verificationCode = otpOneController.value.text +
        otpTwoController.value.text +
        otpThreeController.value.text +
        otpFourController.value.text +
        otpFiveController.value.text +
        otpSixController.value.text;
    Map data = {
      'code': verificationCode,
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
