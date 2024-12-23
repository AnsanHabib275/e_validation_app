import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';

class InputTitleWidget extends StatelessWidget {
  InputTitleWidget({super.key});

  final complainVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complainVM.titleController.value,
        focusNode: complainVM.titleFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'title_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, complainVM.titleFocusNode.value,
              complainVM.userAddressFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'title'.tr,
            labelText: 'title'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
      );
    });
  }
}
