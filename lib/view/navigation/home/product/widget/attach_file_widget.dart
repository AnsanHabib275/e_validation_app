import 'package:e_validation/utils/utils.dart';
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
        style: TextStyle(
          color: AppColor.textBlack80Per,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          hintText: 'attach_file'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack40Per,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: 'attach_file'.tr,
          labelStyle: TextStyle(
            color: AppColor.textColorPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(14),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Get.height * Utils.getResponsiveSize(8))),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Get.height * Utils.getResponsiveSize(8))),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Get.height * Utils.getResponsiveSize(8))),
            borderSide: BorderSide(
              color: AppColor.textColorPrimary, // Default border color
              width: 1.0, // Default border width
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.attach_file,
              color: AppColor.colorPrimary,
              size: Get.height * Utils.getResponsiveSize(27),
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
