import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/statusBar/status_bar_view_model.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  final statusBarVM = Get.put(StatusBarViewModel());
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 400), () {
      Get.toNamed(RoutesName.welcomeScreen);
      // statusBarVM.setStatusBarColor(AppColor.transparent, AppColor.transparent);
      // Get.delete<StatusBarViewModel>();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    statusBarVM.setStatusBarColor(AppColor.colorPrimary, AppColor.colorPrimary);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.colorPrimary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.colorPrimary,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return Scaffold(
        backgroundColor: AppColor.colorPrimary,
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.block_chain_logo),
                SizedBox(
                  width: Get.width * Utils.getResponsiveWidth(14),
                ),
                Text(
                  'powered_by_blockchain'.tr,
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(20),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.textWhite),
                ),
              ],
            ),
          ),
        ));
  }
}
