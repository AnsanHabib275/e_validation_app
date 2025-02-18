import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        height: Get.height * Utils.getResponsiveHeight(64),
        width: Get.width * 1,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.textColorPrimary),
          borderRadius:
              BorderRadius.circular(Get.height * Utils.getResponsiveSize(8)),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) async {
                    signUpVM.isEnable.value = true;
                    String countryCode = '+${country.phoneCode}';
                    signUpVM.countryCodeController.value.text = countryCode;
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                  Text(
                    signUpVM.countryCodeController.value.text.isEmpty
                        ? '+92'
                        : signUpVM.countryCodeController.value.text,
                    style: TextStyle(
                        color: AppColor.textGreyPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                  Image.asset(
                    IconAssets.ic_arrow_down,
                    height: Get.height * Utils.getResponsiveHeight(16),
                    width: Get.width * Utils.getResponsiveWidth(16),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                ],
              ),
            ),
            Container(
              height: Get.height * Utils.getResponsiveHeight(64),
              width: Get.width * Utils.getResponsiveWidth(1),
              color: AppColor.textLightGreyPrimary, // Color of the divider
            ),
            Expanded(
              child: TextFormField(
                controller: signUpVM.phoneNumberController.value,
                focusNode: signUpVM.phoneNumberFocusNode.value,
                enableSuggestions: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                // maxLength: 10,
                style: TextStyle(
                  color: AppColor.textGreyPrimary,
                  fontSize: Get.height * Utils.getResponsiveSize(16),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: 'phone_number'.tr,
                  hintStyle: TextStyle(
                    color: AppColor.textLightGreyPrimary,
                    fontSize: Get.height * Utils.getResponsiveSize(16),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                        Get.height * Utils.getResponsiveSize(8)),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context,
                      signUpVM.phoneNumberFocusNode.value,
                      signUpVM.dateOfBirthFocusNode.value);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
