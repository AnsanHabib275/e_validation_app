import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputMessageWidget extends StatelessWidget {
  InputMessageWidget({super.key});

  final submitComplaintVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: submitComplaintVM.messageController.value,
        focusNode: submitComplaintVM.messageFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'message_cannot_be_blank'.tr;
          }
          return null;
        },
        minLines: 1,
        maxLines: null,
        style: TextStyle(
          color: AppColor.textBlack80Per,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          hintText: 'message'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack40Per,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: 'message'.tr,
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
        keyboardType: TextInputType.text,
      );
    });
  }
}
