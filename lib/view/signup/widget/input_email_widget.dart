import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                signUpVM.passwordFocusNode.value);
          },
          decoration: InputDecoration(
              hintText: 'email'.tr,
              labelText: 'email'.tr,
              errorText: signUpVM.errorMessage.value.isEmpty
                  ? null
                  : signUpVM.errorMessage.value,
              border: OutlineInputBorder()),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
