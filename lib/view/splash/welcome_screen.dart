import 'dart:async';

import 'package:e_validation/view/splash/widget/login_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'welcome'.tr,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 51,
                      color: AppColor.textColorPrimary),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageAssets.splash_screen_logo),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(23),
                    ),
                    Text(
                      'app_title'.tr,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: AppColor.textBlack80Per),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(5),
                    ),
                    Text(
                      'where_fraud_fails'.tr,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: AppColor.textLightGrey80Per),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: LoginButtonWidget(),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'don’t_have_an_account_yet'.tr,
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
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
