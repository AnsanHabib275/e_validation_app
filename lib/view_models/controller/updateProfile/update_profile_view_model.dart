import 'package:e_validation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../repository/reset_password_repository/reset_password_repository.dart';
import '../../../repository/update_profile_repository/update_profile_repository.dart';
import '../../../res/routes/routes_name.dart';

class UpdateProfileViewModel extends GetxController {
  final _api = UpdateProfileRepository();

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final genderController = TextEditingController().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final dateOfBirthFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final genderFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isEnable = false.obs;
  RxString errorMessage = ''.obs;
  RxString imagePath = ''.obs;

  void updateProfileApi(String eid) {
    loading.value = true;
    Map data = {
      "E_ID": eid.toString(),
      "FirstName": firstNameController.value.text,
      "LastName": lastNameController.value.text,
      "MobileNumber": phoneNumberController.value.text,
      "DOB": dateOfBirthController.value.text,
      "Gender": genderController.value.text,
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

  Future getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future takeImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
