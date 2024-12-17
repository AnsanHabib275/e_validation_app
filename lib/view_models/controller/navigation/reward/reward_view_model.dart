import 'package:e_validation/repository/reward_repository/reward_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RewardViewModel extends GetxController {
  final _api = RewardRepository();

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  // void signUpApi() {
  //   loading.value = true;
  //   Map data = {
  //     'email': emailController.value.text,
  //     'password': passwordController.value.text,
  //     'first_name': firstNameController.value.text,
  //     'last_name': lastNameController.value.text,
  //   };
  //   _api.signUpApi(data).then((value) {
  //     loading.value = false;
  //     if (value['error_code'] == 3083) {
  //       errorMessage.value = 'email_already_exists'.tr;
  //     } else if (value['error_code'] == 3084) {
  //       errorMessage.value = 'email_verification_failed'.tr;
  //     } else if (value['error_code'] == 3064) {
  //       errorMessage.value = 'invalid_email'.tr;
  //     } else {
  //       // SignUpModel signUpModel = SignUpModel.fromJson(value);
  //       // userPreference.saveUser(userModel).then((value) {
  //       //   Get.delete<SignUpViewModel>();
  //       // }).onError((error, stackTrace) {});
  //       // Get.toNamed(RoutesName.otpVerificationScreen, arguments: {
  //       //   'email': emailController.value.text,
  //       //   'uid': signUpModel.uid
  //       // })!
  //       //     .then((value) {});
  //     }
  //   }).onError((error, stackTrace) {
  //     loading.value = false;
  //     errorMessage.value = error.toString();
  //   });
  // }
}
