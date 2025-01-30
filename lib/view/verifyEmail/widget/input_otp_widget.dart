import 'package:e_validation/view_models/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../res/colors/app_color.dart';

class InputOTPWidget extends StatelessWidget {
  final String email;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode; // Optional: The next focus node to move to

  InputOTPWidget({
    required this.email,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  final verifyEmailVM = Get.put(VerifyEmailViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          Utils.fieldFocusChange(context, focusNode, nextFocusNode!);
        }
      },
      onChanged: (value) {
        if (value.length == 1) {
          if (nextFocusNode != null) {
            Utils.fieldFocusChange(context, focusNode, nextFocusNode!);
          }
          verifyEmailVM.checkOtpFilled(email);
        }
      },
      style: TextStyle(
        color: AppColor.textGreyPrimary,
        fontSize: Get.height * Utils.getResponsiveSize(20),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: false,
        counterText: "",
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.colorPrimary, // Default border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.colorPrimary, // Default border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.colorPrimary, // Default border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
      ),
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
    );
  }
}
