import 'package:e_validation/res/urls/app_url.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../models/login/login_model.dart';
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
    Map<String, String> data = {
      "E_ID": eid.toString(),
      "FirstName": firstNameController.value.text,
      "LastName": lastNameController.value.text,
      "MobileNumbre": phoneNumberController.value.text,
      "DOB": Utils.apiFormatDate(dateOfBirthController.value.text),
      "CountryCode": countryCodeController.value.text,
      "ImageURL": imagePath.value,
    };
    print(data);
    _api.updateProfileApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage('Profile Update Successfully');
        LoginModel loginModel = LoginModel.fromJson(value);
        Get.find<UserPreference>().saveUser(loginModel).then((value) {
          Get.delete<UpdateProfileViewModel>();
          Get.find<UserPreference>().fetchUserDetails();
          Get.back();
        }).onError((error, stackTrace) {
          errorMessage.value = error.toString();
        });
        // Get.back();
        // Get.find<UserPreference>().removeUser();
        // Get.offAllNamed(RoutesName.loginScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }

  Future getImageFromGallery(String eid) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // imagePath.value = AppUrl.baseUrl + image.path.toString();
      uploadProfileImageApi(eid, image.path);
      if (kDebugMode) {
        print('image :${image.path}');
      }
    }
  }

  Future takeImageFromCamera(String eid) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print(image.path);
      uploadProfileImageApi(eid, image.path);
      // imagePath.value = AppUrl.baseUrl+image.path.toString();
    }
  }

  Future<void> uploadProfileImageApi(String eid, String imagePathStr) async {
    loading.value = true;
    Map<String, String> data = {
      'E_ID': eid.trim(),
    };
    List<http.MultipartFile> files = [];
    if (imagePathStr.isNotEmpty) {
      var file = await http.MultipartFile.fromPath(
        'file',
        imagePathStr,
      );
      files.add(file);
    }
    print(data);
    _api.uploadProfileImageApi(data, files).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        // Utils.toastMessage('Profile Update Successfully');
        // Get.toNamed(RoutesName.loginScreen);
        String imageUrl = value['imageURL'];
        imagePath.value = AppUrl.baseUrl + imageUrl ?? '';
        print(AppUrl.baseUrl + imageUrl);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
