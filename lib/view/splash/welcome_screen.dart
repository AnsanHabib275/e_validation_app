import 'dart:async';

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
    // Timer(const Duration(seconds: 5),
    //     () => Get.toNamed(RoutesName.splashScreenTwo));
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
                      fontFamily: FontAssets.poppins_semi_bold,
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
                          fontFamily: FontAssets.poppins_semi_bold,
                          fontSize: 30,
                          color: AppColor.textBlackPrimary),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(5),
                    ),
                    Text(
                      'where_fraud_fails'.tr,
                      style: TextStyle(
                          fontFamily: FontAssets.poppins_regular,
                          fontSize: 20,
                          color: AppColor.textBlackPrimary),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.loginScreen);
                        },
                        child: Container(
                          height: 64,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.colorPrimary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'login'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'don’t_have_an_account_yet'.tr,
                          style: TextStyle(
                              fontFamily: FontAssets.poppins_regular,
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
                                fontFamily: FontAssets.poppins_regular,
                                fontSize: 19,
                                color: AppColor.underlineTextColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
