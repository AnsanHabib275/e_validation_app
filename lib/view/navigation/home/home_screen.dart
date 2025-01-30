import 'package:e_validation/data/exceptions/app_exceptions.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/home/widget/scan_now_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splash_bg), // Your background image
              fit: BoxFit.cover, // Adjust to cover the entire screen
            ),
          ),
        ),
        MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            body: Center(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.scan_me_logo),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(30),
                  ),
                  Text(
                    'tap_the_bellow_button_to_scan_the_product'.tr,
                    style: TextStyle(
                        color: AppColor.textGreyPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * Utils.getResponsiveSize(20)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(73),
                  ),
                  ScanNowButtonWidget(),
                ],
              ),
            )),
          ),
        )
      ],
    );
  }
}
