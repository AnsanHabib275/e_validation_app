import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/updateProfile/update_profile_view_model.dart';

class InputGenderWidget extends StatelessWidget {
  InputGenderWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final List<String> gender = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: AppColor.textGreyPrimary,
        fontSize: Get.height * Utils.getResponsiveSize(16),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: 'gender'.tr,
        hintStyle: TextStyle(
          color: AppColor.textLightGreyPrimary,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelText: 'gender'.tr,
        labelStyle: TextStyle(
          color: AppColor.textColorPrimary,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8))),
          borderSide: BorderSide(
            color: AppColor.textColorPrimary, // Default border color
            width: 1.0, // Default border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8))),
          borderSide: BorderSide(
            color: AppColor.textColorPrimary, // Default border color
            width: 1.0, // Default border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8))),
          borderSide: BorderSide(
            color: AppColor.textColorPrimary, // Default border color
            width: 1.0, // Default border width
          ),
        ),
      ),
      // value: selectedGender,
      items: gender.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) updateProfileVM.genderController.value.text = value;
      },
      icon: Image.asset(
        IconAssets.ic_arrow_down,
        height: Get.height * Utils.getResponsiveHeight(16),
        width: Get.width * Utils.getResponsiveWidth(16),
      ),
      validator: (value) => value == null ? 'Please select gender' : null,
    );
  }
}
