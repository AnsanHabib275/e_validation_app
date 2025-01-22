import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/login/widget/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/login/login_view_model.dart';
import '../login/widget/input_email_widget.dart';
import '../login/widget/input_password_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(100),
                    ),
                    SvgPicture.asset(
                      ImageAssets.splash_screen_logo,
                      height: Get.height * Utils.getResponsiveHeight(106),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(36),
                    ),
                    Text(
                      'login'.tr,
                      style: const TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 51,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(130),
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            InputEmailWidget(),
                            SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(22)),
                            InputPasswordWidget(),
                          ],
                        )),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(10)),
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.forgetPasswordScreen);
                          },
                          child: Text(
                            'forgot_password_with_question'.tr,
                            style: const TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(50)),
                    LoginButtonWidget(formkey: _formkey),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(20)),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don’t_have_an_account_yet'.tr,
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: AppColor.textBlackPrimary),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesName.signUpScreen);
                            },
                            child: Text(
                              'signup'.tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                  color: AppColor.underlineTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(50)),
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
