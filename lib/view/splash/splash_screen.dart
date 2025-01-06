import 'dart:async';

import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 900),
        () => Get.toNamed(RoutesName.splashScreenTwo));
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(children: [
          Image(
            height: Get.height * 1,
            width: Get.width * 1,
            image: AssetImage(ImageAssets.splash_bg),
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
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
                      color: AppColor.textBlack80Per),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: Get.height * Utils.getResponsiveHeight(66),
              decoration: const BoxDecoration(
                  color: AppColor.colorPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.block_chain_logo),
                  SizedBox(
                    width: Get.width * Utils.getResponsiveWidth(14),
                  ),
                  Text(
                    'powered_by_blockchain'.tr,
                    style: TextStyle(
                        fontFamily: 'Poppins',
fontWeight: FontWeight.w500,
                        color: AppColor.textWhite),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
