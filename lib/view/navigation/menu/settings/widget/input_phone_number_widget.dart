import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  InputPhoneNumberWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return TextFormField(
          controller: updateProfileVM.phoneNumberController.value,
          focusNode: updateProfileVM.phoneNumberFocusNode.value,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 11) {
              return 'phone_number_not_valid'.tr;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'phone_number'.tr,
            hintStyle: TextStyle(
              color: AppColor.textBlack80Per,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            labelText: 'phone_number'.tr,
            labelStyle: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: AppColor.textColorPrimary, // Default border color
                width: 1.0, // Default border width
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: AppColor.textColorPrimary, // Default border color
                width: 1.0, // Default border width
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: AppColor.textColorPrimary, // Default border color
                width: 1.0, // Default border width
              ),
            ),
          ),
          keyboardType: TextInputType.phone,
        );
      },
    );
  }
}
