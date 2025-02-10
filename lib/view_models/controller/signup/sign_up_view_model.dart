import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  final passwordController = TextEditingController().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;
  final dateOfBirthFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isEnable = false.obs;
  RxString errorMessage = ''.obs;

  void signUpApi() {
    loading.value = true;
    String formattedDOB = "";
    if (dateOfBirthController.value.text.isNotEmpty) {
      try {
        DateTime parsedDate = DateFormat("MM/dd/yyyy").parse(
            dateOfBirthController.value.text); // Adjust format if necessary
        formattedDOB = DateFormat("yyyy-MM-dd").format(parsedDate);
      } catch (e) {
        print("Invalid date format: ${dateOfBirthController.value.text}");
      }
    }
    Map data = {
      'FirstName': firstNameController.value.text,
      'LastName': lastNameController.value.text,
      'email': emailController.value.text,
      'CountryCode': countryCodeController.value.text,
      'PhoneNumber': phoneNumberController.value.text,
      'DOB': formattedDOB,
      'password': passwordController.value.text,
    };
    print(data);
    _api.signUpApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage("OTP Sent To Your Email Account");
        Get.toNamed(RoutesName.verifyEmailScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
