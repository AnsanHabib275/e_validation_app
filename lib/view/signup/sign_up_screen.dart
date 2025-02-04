import 'package:e_validation/view/signup/widget/input_phone_number_widget.dart';
import 'package:e_validation/view/signup/widget/create_account_button_widget.dart';
import 'package:e_validation/view/signup/widget/input_date_of_birth_widget.dart';
import 'package:e_validation/view/signup/widget/input_gender_widget.dart';
import 'package:e_validation/view/signup/widget/input_last_name_widget.dart';
import 'package:e_validation/view/signup/widget/input_first_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/signup/sign_up_view_model.dart';
import '../signup/widget/input_email_widget.dart';
import '../signup/widget/input_password_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    ImageAssets.splash_bg), // Replace with your image path
                fit: BoxFit.cover, // Adjust the image to fill the screen
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(30)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(91),
                    ),
                    Image.asset(
                      ImageAssets.splash_screen_logo,
                      height: Get.height * Utils.getResponsiveHeight(106),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(36),
                    ),
                    Text(
                      'signup'.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(51),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
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
                              height:
                                  Get.height * Utils.getResponsiveHeight(22)),
                          InputLastNameWidget(),
                          SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(22)),
                          InputEmailWidget(),
                          SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(22)),
                          InputPhoneNumberWidget(),
                          SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(22)),
                          InputDateOfBirthWidget(),
                          SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(22)),
                          // InputGenderWidget(),
                          // SizedBox(
                          //     height:
                          //         Get.height * Utils.getResponsiveHeight(22)),
                          InputPasswordWidget(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(50),
                    ),
                    CreateAccountButtonWidget(formkey: _formkey),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already_have_an_account'.tr,
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(19),
                              color: AppColor.textBlackPrimary),
                        ),
                        SizedBox(
                          width: Get.width * Utils.getResponsiveWidth(5),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.loginScreen);
                          },
                          child: Text(
                            'login'.tr,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(19),
                                color: AppColor.underlineTextColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(100)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
