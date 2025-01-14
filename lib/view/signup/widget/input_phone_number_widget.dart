import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  InputPhoneNumberWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.phoneNumberController.value,
        focusNode: signUpVM.phoneNumberFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'phone_number_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, signUpVM.phoneNumberFocusNode.value,
              signUpVM.dateOfBirthFocusNode.value);
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
    });
  }
}
