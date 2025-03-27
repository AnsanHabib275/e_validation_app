import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/verify_email_repository/verify_email_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

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

  // void checkOtpFilled() {
  //   if (otpOneController.value.text.isNotEmpty &&
  //       otpTwoController.value.text.isNotEmpty &&
  //       otpThreeController.value.text.isNotEmpty &&
  //       otpFourController.value.text.isNotEmpty &&
  //       otpFiveController.value.text.isNotEmpty &&
  //       otpSixController.value.text.isNotEmpty) {
  //     verifyEmailApi();
  //   }
  // }
  RxBool isOtpFilled = false.obs;

  void checkOtpFilled() {
    isOtpFilled.value = otpOneController.value.text.isNotEmpty &&
        otpTwoController.value.text.isNotEmpty &&
        otpThreeController.value.text.isNotEmpty &&
        otpFourController.value.text.isNotEmpty &&
        otpFiveController.value.text.isNotEmpty &&
        otpSixController.value.text.isNotEmpty;
  }

  void clearFields() {
    otpOneController.value.text = '';
    otpTwoController.value.text = '';
    otpThreeController.value.text = '';
    otpFourController.value.text = '';
    otpFiveController.value.text = '';
    otpSixController.value.text = '';
    isOtpFilled.value = false;
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
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Get.toNamed(RoutesName.accountCreatedScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }

  void resendCodeApi(int accountId) {
    loading.value = true;
    Map data = {
      'U_Id': accountId,
    };
    _api.resendCodeApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage("OTP Sent To Your Email Account");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
