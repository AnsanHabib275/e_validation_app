import 'package:country_picker/country_picker.dart';
import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  InputPhoneNumberWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final FocusNode _parentFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            focusNode: _parentFocusNode,
            onFocusChange: (hasFocus) =>
                updateProfileVM.isPhoneInputFocused.value = hasFocus,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: updateProfileVM.isPhoneInputFocused.value
                    ? 'phone_number'.tr
                    : null,
                labelStyle: TextStyle(
                  color: AppColor.textColorPrimary,
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Get.height * Utils.getResponsiveSize(8),
                  ),
                  borderSide: BorderSide(color: AppColor.textColorPrimary),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(12),
                  vertical: Get.height * Utils.getResponsiveHeight(0),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) async {
                          updateProfileVM.handleCountrySelection(country);
                        },
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(8)),
                        IntrinsicWidth(
                          child: TextFormField(
                              controller:
                                  updateProfileVM.countryCodeController.value,
                              focusNode:
                                  updateProfileVM.countryCodeFocusNode.value,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.none,
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) async {
                                    updateProfileVM
                                        .handleCountrySelection(country);
                                  },
                                );
                              },
                              style: TextStyle(
                                  color: AppColor.textGreyPrimary,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(16),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                hintText: 'hint_country_code'.tr,
                                hintStyle: TextStyle(
                                  color: AppColor.textGreyPrimary,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(16),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              )),
                        ),
                        SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(10)),
                        Image.asset(
                          IconAssets.ic_arrow_down,
                          height: Get.height * Utils.getResponsiveHeight(16),
                          width: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(10)),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * Utils.getResponsiveHeight(64),
                    width: Get.width * Utils.getResponsiveWidth(1),
                    color:
                        AppColor.textLightGreyPrimary, // Color of the divider
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: updateProfileVM.phoneNumberController.value,
                      focusNode: updateProfileVM.phoneNumberFocusNode.value,
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
                            updateProfileVM.phoneNumberFocusNode.value,
                            updateProfileVM.dateOfBirthFocusNode.value);
                      },
                      onChanged: (value) async {
                        await updateProfileVM.validatePhoneNumber(value);
                        updateProfileVM.formatPhoneNumber(value);
                      },
                      validator: (value) {
                        updateProfileVM.validatePhoneNumber(value!);
                        updateProfileVM.formatPhoneNumber(value);
                        return null;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (updateProfileVM.phoneError.value.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * Utils.getResponsiveWidth(15),
                top: Get.height * Utils.getResponsiveHeight(4),
              ),
              child: Text(
                updateProfileVM.phoneError.value,
                style: TextStyle(
                  color: AppColor.redColor,
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      );
    });
  }
}
