import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';

class InputGenderSpinnerWidget extends StatelessWidget {
  InputGenderSpinnerWidget({super.key});
  final List<String> gender = ['Male', 'Female'];
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'gender'.tr,
        hintStyle: TextStyle(
          color: AppColor.textBlack80Per,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        labelText: 'gender'.tr,
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
      // value: selectedGender,
      items: gender.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: (value) {},
      icon: Image.asset(
        IconAssets.ic_arrow_down,
        height: 16,
        width: 16,
      ),
      validator: (value) => value == null ? 'Please select gender' : null,
    );
  }
}
