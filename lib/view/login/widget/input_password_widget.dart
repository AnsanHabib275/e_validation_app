import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: loginVM.passwordController.value,
        focusNode: loginVM.passwordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'password'.tr,
          labelText: 'password'.tr,
          errorText: loginVM.errorMessage.value.isEmpty
              ? null
              : loginVM.errorMessage.value,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              loginVM.isVisible.value ? Icons.visibility : Icons.visibility_off,
              color: AppColor.colorPrimary,
            ),
            onPressed: () {
              loginVM.isVisible.value = !loginVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: loginVM.isVisible.value,
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
