import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: loginVM.emailController.value,
        focusNode: loginVM.emailFocusNode.value,
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
          Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
              loginVM.passwordFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'email'.tr,
            labelText: 'email'.tr,
            errorText: loginVM.errorMessage.value.isEmpty
                ? null
                : loginVM.errorMessage.value,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.emailAddress,
      );
    });
  }
}
