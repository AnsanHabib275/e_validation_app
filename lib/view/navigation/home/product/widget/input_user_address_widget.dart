import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputUserAddressWidget extends StatelessWidget {
  InputUserAddressWidget({super.key});

  final submitComplainVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: submitComplainVM.userAddressController.value,
        focusNode: submitComplainVM.userAddressFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'user_address_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
              context,
              submitComplainVM.userAddressFocusNode.value,
              submitComplainVM.productIdFocusNode.value);
        },
        decoration: InputDecoration(
          hintText: 'user_address'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack80Per,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          labelText: 'user_address'.tr,
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
        ),
        keyboardType: TextInputType.streetAddress,
      );
    });
  }
}
