import 'package:e_validation/view_models/controller/signup/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputDateOfBirthWidget extends StatelessWidget {
  InputDateOfBirthWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.dateOfBirthController.value,
        focusNode: signUpVM.dateOfBirthFocusNode.value,
        enableSuggestions: true,
        readOnly: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'date_of_birth'.tr,
          hintStyle: TextStyle(
            color: AppColor.textBlack80Per,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
          labelText: 'date_of_birth'.tr,
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
            return 'date_of_birth_cannot_be_blank'.tr;
          }
          return null; // Return null if there is no error
        },
      );
    });
  }
}
