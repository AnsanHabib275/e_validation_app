import 'package:e_validation/view_models/controller/signup/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class InputGenderWidget extends StatelessWidget {
  InputGenderWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.genderController.value,
        focusNode: signUpVM.genderFocusNode.value,
        enableSuggestions: true,
        readOnly: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
          suffixIcon: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: AppColor.colorPrimary,
            ),
            onPressed: () {
              _showGenderOptions(context);
            },
          ),
        ),
        keyboardType: TextInputType.none,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'gender_cannot_be_blank'.tr;
          }
          return null; // Return null if there is no error
        },
        onTap: () {
          _showGenderOptions(context);
        },
      );
    });
  }

  void _showGenderOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Male'),
                onTap: () {
                  signUpVM.gender.value = 'Male';
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Female'),
                onTap: () {
                  signUpVM.gender.value = 'Female';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
