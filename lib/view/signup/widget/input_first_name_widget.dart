import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputFirstNameWidget extends StatelessWidget {
  InputFirstNameWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.firstNameController.value,
        focusNode: signUpVM.firstNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'first_name_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, signUpVM.firstNameFocusNode.value,
              signUpVM.lastNameFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'first_name'.tr,
            labelText: 'first_name'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
      );
    });
  }
}
