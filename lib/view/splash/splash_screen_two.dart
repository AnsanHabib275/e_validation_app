import 'package:e_validation/view_models/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  final loginServiceVM = Get.put(LoginServices());

  @override
  void initState() {
    super.initState();
    loginServiceVM.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
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
          )),
    );
  }
}
