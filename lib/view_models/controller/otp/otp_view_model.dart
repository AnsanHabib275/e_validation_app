import 'package:e_validation/repository/otp_repository/otp_repository.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../res/routes/routes_name.dart';

class OTPViewModel extends GetxController {
  final _api = OTPRepository();

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

  // void checkOtpFilled(String e_id) {
  //   if (otpOneController.value.text.isNotEmpty &&
  //       otpTwoController.value.text.isNotEmpty &&
  //       otpThreeController.value.text.isNotEmpty &&
  //       otpFourController.value.text.isNotEmpty &&
  //       otpFiveController.value.text.isNotEmpty &&
  //       otpSixController.value.text.isNotEmpty) {
  //     otpApi(e_id);
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

  void otpApi(String eId) {
    loading.value = true;
    final verificationCode = otpOneController.value.text +
        otpTwoController.value.text +
        otpThreeController.value.text +
        otpFourController.value.text +
        otpFiveController.value.text +
        otpSixController.value.text;
    Map data = {
      'Otp': verificationCode,
      'E_id': eId,
    };
    print(data);
    _api.otpApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage("OTP VERIFIED SUCCESSFULLY");
        Get.toNamed(RoutesName.resetPasswordScreen, arguments: {
          'eID': eId,
        });
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
      Utils.toastMessage(error.toString());
    });
  }
}
