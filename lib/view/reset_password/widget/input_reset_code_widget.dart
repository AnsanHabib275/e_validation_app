import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/resetPassword/reset_password_view_model.dart';

class InputResetCodeWidget extends StatelessWidget {
  const InputResetCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordVM = Get.put(ResetPasswordViewModel());
    return Obx(() {
      return TextFormField(
        controller: resetPasswordVM.resetCodeController.value,
        focusNode: resetPasswordVM.resetCodeFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 6) {
            return 'reset_code_not_valid'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
              context,
              resetPasswordVM.resetCodeFocusNode.value,
              resetPasswordVM.passwordFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'reset_code'.tr,
            labelText: 'reset_code'.tr,
            errorText: resetPasswordVM.errorMessage.value.isEmpty
                ? null
                : resetPasswordVM.errorMessage.value,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        maxLength: 6,
      );
    });
  }
}
