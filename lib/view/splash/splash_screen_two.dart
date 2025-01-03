import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Get.toNamed(RoutesName.welcomeScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorPrimary,
        body: Center(
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
                textScaleFactor: 1,
                style: TextStyle(
                    fontFamily: FontAssets.poppins_medium,
                    color: AppColor.textWhite),
              ),
            ],
          ),
        ));
  }
}
