import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputLastNameWidget extends StatelessWidget {
  InputLastNameWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.lastNameController.value,
        focusNode: signUpVM.lastNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'last_name_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, signUpVM.lastNameFocusNode.value,
              signUpVM.emailFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'last_name'.tr,
            labelText: 'last_name'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.text,
      );
    });
  }
}
