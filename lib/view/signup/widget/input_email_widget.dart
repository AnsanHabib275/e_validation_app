import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return TextFormField(
          controller: signUpVM.emailController.value,
          focusNode: signUpVM.emailFocusNode.value,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
              return 'email_not_valid'.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            Utils.fieldFocusChange(context, signUpVM.emailFocusNode.value,
                signUpVM.phoneNumberFocusNode.value);
          },
          style: TextStyle(
            color: AppColor.textGreyPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'email'.tr,
            hintStyle: TextStyle(
              color: AppColor.textLightGreyPrimary,
              fontSize: Get.height * Utils.getResponsiveSize(16),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            labelText: 'email'.tr,
            labelStyle: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: Get.height * Utils.getResponsiveSize(14),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            errorText: signUpVM.errorMessage.value.isEmpty
                ? null
                : signUpVM.errorMessage.value,
            errorStyle: TextStyle(
              color: AppColor.redColor,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Get.height * Utils.getResponsiveSize(8))),
              borderSide: BorderSide(
                color: AppColor.redColor, // Default border color
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Get.height * Utils.getResponsiveSize(8))),
              borderSide: BorderSide(
                color: AppColor.redColor, // Default border color
                width: 1.0, // Default border width
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
