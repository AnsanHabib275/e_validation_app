import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';

class InputUserNameWidget extends StatelessWidget {
  InputUserNameWidget({super.key});

  final complainVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complainVM.userNameController.value,
        focusNode: complainVM.userNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'user_name_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, complainVM.userNameFocusNode.value,
              complainVM.userLatLngFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'user_name'.tr,
            labelText: 'user_name'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
      );
    });
  }
}
