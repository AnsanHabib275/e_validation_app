import 'package:e_validation/view/navigation/menu/settings/widget/input_first_name_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_last_name_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_phone_number_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/update_button_widget.dart';
import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final _formkey = GlobalKey<FormState>();
  String? eid = '';

  Future<void> getUserDetail() async {
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      setState(() {
        eid = user.user?.eID;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(120),
                ),
                Text(
                  'profile_setup'.tr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: AppColor.textColorPrimary,
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(40),
                ),
                Text(
                  'please_enter_your_credentials_with_the_following_criteria_below'
                      .tr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: AppColor.textColorPrimary,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(40),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      InputFirstNameWidget(),
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(22)),
                      InputLastNameWidget(),
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(22)),
                      InputPhoneNumberWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(50),
                ),
                UpdateButtonWidget(
                  formkey: _formkey,
                  eid: eid,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
