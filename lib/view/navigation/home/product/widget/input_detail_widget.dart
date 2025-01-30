import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputDetailWidget extends StatelessWidget {
  InputDetailWidget({super.key});

  final submitComplaintVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: submitComplaintVM.detailController.value,
        focusNode: submitComplaintVM.detailFocusNode.value,
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
        style: TextStyle(
          color: AppColor.textGreyPrimary,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: 'detail'.tr,
          hintStyle: TextStyle(
            color: AppColor.textLightGreyPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: 'detail'.tr,
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
        ),
        keyboardType: TextInputType.text,
      );
    });
  }
}
