import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../view_models/controller/login/login_view_model.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.passwordController.value,
        focusNode: signUpVM.passwordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'password'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack80Per,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          labelText: 'password'.tr,
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
          suffixIcon: IconButton(
            icon: signUpVM.isVisible.value
                ? SvgPicture.asset(IconAssets.ic_visible_password)
                : SvgPicture.asset(IconAssets.ic_invisible_password),
            color: AppColor.colorPrimary,
            onPressed: () {
              signUpVM.isVisible.value = !signUpVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: signUpVM.isVisible.value,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'password_format_invalid'.tr;
          }
          return null; // Return null if there is no error
        },
      );
    });
  }
}
