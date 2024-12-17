import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';

class InputProductIdWidget extends StatelessWidget {
  InputProductIdWidget({super.key});

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return TextFormField(
          controller: complaintVM.productIdController.value,
          focusNode: complaintVM.productIdFocusNode.value,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'email_not_valid'.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            Utils.fieldFocusChange(
                context,
                complaintVM.productIdFocusNode.value,
                complaintVM.attachFileFocusNode.value);
          },
          decoration: InputDecoration(
              hintText: 'product_id'.tr,
              labelText: 'product_id'.tr,
              errorText: complaintVM.errorMessage.value.isEmpty
                  ? null
                  : complaintVM.errorMessage.value,
              border: OutlineInputBorder()),
          keyboardType: TextInputType.text,
        );
      },
    );
  }
}
