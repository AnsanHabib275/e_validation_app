import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/complain/complain_view_model.dart';

class InputUserAddressWidget extends StatelessWidget {
  InputUserAddressWidget({super.key});

  final complainVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complainVM.userAddressController.value,
        focusNode: complainVM.userAddressFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'user_address_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, complainVM.userAddressFocusNode.value,
              complainVM.productIdFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'user_address'.tr,
            labelText: 'user_address'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.streetAddress,
      );
    });
  }
}
