import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
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

            hintStyle: TextStyle(
              color: AppColor.textBlack80Per,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            labelText: 'product_id'.tr,
            labelStyle: TextStyle(
              color: AppColor.textColorPrimary,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
              errorText: complaintVM.errorMessage.value.isEmpty
                  ? null
                  : complaintVM.errorMessage.value,
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
            ),),
          keyboardType: TextInputType.text,
        );
      },
    );
  }
}
