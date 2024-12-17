import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';

class AttachFileWidget extends StatelessWidget {
  AttachFileWidget({super.key});

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: complaintVM.attachFileController.value,
        focusNode: complaintVM.attachFileFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'attach_file'.tr,
          labelText: 'attach_file'.tr,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.attach_file,
              color: AppColor.colorPrimary,
            ),
            onPressed: () {
              // complaintVM.isVisible.value = !complaintVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.none,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'attach_file_invalid'.tr;
          }
          return null; // Return null if there is no error
        },
      );
    });
  }
}
