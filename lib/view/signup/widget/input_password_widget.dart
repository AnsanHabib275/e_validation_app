import 'package:flutter/material.dart';
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
          labelText: 'password'.tr,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              signUpVM.isVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColor.colorPrimary,
            ),
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
