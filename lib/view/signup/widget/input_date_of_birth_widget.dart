import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/view_models/controller/signup/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class InputDateOfBirthWidget extends StatelessWidget {
  InputDateOfBirthWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Default date
      firstDate: DateTime(2000), // Earliest allowed date
      lastDate: DateTime(2100), // Latest allowed date
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      final formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      signUpVM.dateOfBirthController.value.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          _selectDate(context); // Open the date picker on tap
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: signUpVM.dateOfBirthController.value,
            focusNode: signUpVM.dateOfBirthFocusNode.value,
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              color: AppColor.textGreyPrimary,
              fontSize: Get.height * Utils.getResponsiveSize(16),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                hintText: 'date_of_birth'.tr,
                hintStyle: TextStyle(
                  color: AppColor.textLightGreyPrimary,
                  fontSize: Get.height * Utils.getResponsiveSize(16),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'date_of_birth'.tr,
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
                suffixIcon: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Image.asset(IconAssets.ic_date))),
            keyboardType: TextInputType.none,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'date_of_birth_cannot_be_blank'.tr;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context,
                  signUpVM.dateOfBirthFocusNode.value,
                  signUpVM.passwordFocusNode.value);
            },
          ),
        ),
      );
    });
  }
}
