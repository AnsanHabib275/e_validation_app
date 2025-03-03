import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputProductIdWidget extends StatelessWidget {
  InputProductIdWidget({super.key});

  final submitComplaintVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return TextFormField(
          controller: submitComplaintVM.productIdController.value,
          focusNode: submitComplaintVM.productIdFocusNode.value,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'product_id_cannot_be_empty'.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            Utils.fieldFocusChange(
                context,
                submitComplaintVM.productIdFocusNode.value,
                submitComplaintVM.attachFileFocusNode.value);
          },
          style: TextStyle(
            color: AppColor.textGreyPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'product_id'.tr,
            hintStyle: TextStyle(
              color: AppColor.textLightGreyPrimary,
              fontSize: Get.height * Utils.getResponsiveSize(16),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            labelText: 'product_id'.tr,
            labelStyle: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: Get.height * Utils.getResponsiveSize(14),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            errorText: submitComplaintVM.errorMessage.value.isEmpty
                ? null
                : submitComplaintVM.errorMessage.value,
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
      },
    );
  }
}
