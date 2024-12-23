import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/complain/complain_view_model.dart';

class InputUserLatLngWidget extends StatelessWidget {
  InputUserLatLngWidget({super.key});

  final complainVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complainVM.userLatLngController.value,
        focusNode: complainVM.userLatLngFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'user_lat_lng_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, complainVM.userLatLngFocusNode.value,
              complainVM.titleFocusNode.value);
        },
        decoration: InputDecoration(
            hintText: 'user_lat_lng'.tr,
            labelText: 'user_lat_lng'.tr,
            border: OutlineInputBorder()),
        keyboardType: TextInputType.streetAddress,
      );
    });
  }
}
