import 'package:e_validation/repository/complain_repository/complain_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ComplainViewModel extends GetxController {
  final _api = ComplainRepository();

  final productIdController = TextEditingController().obs;
  final attachFileController = TextEditingController().obs;
  final messageController = TextEditingController().obs;

  final userNameController = TextEditingController().obs;
  final userLatLngController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final userAddressController = TextEditingController().obs;
  final detailController = TextEditingController().obs;

  final productIdFocusNode = FocusNode().obs;
  final attachFileFocusNode = FocusNode().obs;
  final messageFocusNode = FocusNode().obs;

  final userNameFocusNode = FocusNode().obs;
  final userLatLngFocusNode = FocusNode().obs;
  final titleFocusNode = FocusNode().obs;
  final userAddressFocusNode = FocusNode().obs;
  final detailFocusNode = FocusNode().obs;

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
  //     if (value['errorcode'] == 3083) {
  //       errorMessage.value = 'email_already_exists'.tr;
  //     } else if (value['errorcode'] == 3084) {
  //       errorMessage.value = 'email_verification_failed'.tr;
  //     } else if (value['errorcode'] == 3064) {
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
