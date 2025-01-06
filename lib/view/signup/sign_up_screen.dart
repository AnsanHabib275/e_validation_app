import 'package:e_validation/view/signup/widget/create_account_button_widget.dart';
import 'package:e_validation/view/signup/widget/input_last_name_widget.dart';
import 'package:e_validation/view/signup/widget/input_first_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(150),
                  ),
                  SvgPicture.asset(
                    ImageAssets.splash_screen_logo,
                    height: Get.height * Utils.getResponsiveHeight(106),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(36),
                  ),
                  Text(
                    'signup'.tr,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 51,
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
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputLastNameWidget(),
                        SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputEmailWidget(),
                        SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputPasswordWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                  CreateAccountButtonWidget(formkey: _formkey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
