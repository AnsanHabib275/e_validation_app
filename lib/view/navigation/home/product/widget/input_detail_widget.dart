import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputDetailWidget extends StatelessWidget {
  InputDetailWidget({super.key});

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complaintVM.detailController.value,
        focusNode: complaintVM.detailFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'detail_cannot_be_blank'.tr;
          }
          return null;
        },
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
            hintText: 'detail'.tr,
            labelText: 'detail'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.text,
      );
    });
  }
}
