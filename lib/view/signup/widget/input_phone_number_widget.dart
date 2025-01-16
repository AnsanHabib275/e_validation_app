import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  InputPhoneNumberWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) async {
                    String countryCode = '+${country.phoneCode}';
                    signUpVM.countryCodeController.value.text = countryCode;
                    // setState(() {
                    //   _selectedCountryCode = countryCode;
                    // });
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    signUpVM.countryCodeController.value.text,
                    // _selectedCountryCode,
                    style: TextStyle(
                        color: AppColor.textBlack80Per.withOpacity(0.7),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                  Image.asset(IconAssets.ic_country_picker),
                ],
              ),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            Container(
              height: 64, // Height of the divider
              width: 1, // Thickness of the divider
              color: AppColor.textBlack80Per
                  .withOpacity(0.4), // Color of the divider
            ),
            Expanded(
              child: TextField(
                controller: signUpVM.phoneNumberController.value,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
