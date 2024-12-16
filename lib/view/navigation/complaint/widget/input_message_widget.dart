import 'package:e_validation/view_models/controller/navigation/complaint/complaint_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class InputMessageWidget extends StatelessWidget {
  InputMessageWidget({super.key});

  final complaintVM = Get.put(ComplaintViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complaintVM.messageController.value,
        focusNode: complaintVM.messageFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'message_cannot_be_blank'.tr;
          }
          return null;
        },
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
            hintText: 'message'.tr,
            labelText: 'message'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.text,
      );
    });
  }
}
