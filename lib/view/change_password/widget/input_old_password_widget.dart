import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/changePassword/change_password_view_model.dart';

class InputOldPasswordWidget extends StatelessWidget {
  InputOldPasswordWidget({super.key});

  final changePasswordVM = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: changePasswordVM.oldPasswordController.value,
        focusNode: changePasswordVM.oldPasswordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: AppColor.textGreyPrimary,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: 'existing_password'.tr,
          hintStyle: TextStyle(
            color: AppColor.textLightGreyPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: 'existing_password'.tr,
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
              changePasswordVM.isVisible.value
                  ? IconAssets.ic_invisible_password
                  : IconAssets.ic_visible_password,
            ),
            onPressed: () {
              changePasswordVM.isVisible.value =
                  !changePasswordVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: changePasswordVM.isVisible.value,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'existing_password_format_invalid'.tr;
          }
          return null; // Return null if there is no error
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
              context,
              changePasswordVM.oldPasswordFocusNode.value,
              changePasswordVM.newPasswordFocusNode.value);
        },
      );
    });
  }
}
