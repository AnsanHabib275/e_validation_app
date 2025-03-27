import 'package:e_validation/view_models/controller/resetPassword/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputConfirmPasswordWidget extends StatelessWidget {
  InputConfirmPasswordWidget({super.key});

  final resetPasswordVM = Get.put(ResetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: resetPasswordVM.confirmPasswordController.value,
        focusNode: resetPasswordVM.confirmPasswordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: AppColor.textGreyPrimary,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: 'confirm_password'.tr,
          hintStyle: TextStyle(
            color: AppColor.textLightGreyPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: 'confirm_password'.tr,
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
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              resetPasswordVM.isConfirmPasswordVisible.value
                  ? IconAssets.ic_invisible_password
                  : IconAssets.ic_visible_password,
            ),
            onPressed: () {
              resetPasswordVM.isConfirmPasswordVisible.value =
                  !resetPasswordVM.isConfirmPasswordVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: resetPasswordVM.isConfirmPasswordVisible.value,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'confirm_password_format_invalid'.tr;
          } else if (value !=
              resetPasswordVM.newPasswordController.value.text) {
            return 'confirm_password_not_match'.tr;
          }
          return null; // Return null if there is no error
        },
      );
    });
  }
}
