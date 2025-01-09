import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class AttachFileWidget extends StatelessWidget {
  AttachFileWidget({super.key});

  final submitComplaintVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: submitComplaintVM.attachFileController.value,
        focusNode: submitComplaintVM.attachFileFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'attach_file'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack80Per,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
          labelText: 'attach_file'.tr,
          labelStyle: TextStyle(
            color: AppColor.textColorPrimary,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.attach_file,
              color: AppColor.colorPrimary,
            ),
            onPressed: () {
              // submitComplaintVM.isVisible.value = !submitComplaintVM.isVisible.value;
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
