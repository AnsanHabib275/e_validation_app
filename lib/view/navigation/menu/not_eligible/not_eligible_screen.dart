import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/colors/app_color.dart';

class NotEligibleScreen extends StatefulWidget {
  const NotEligibleScreen({super.key});

  @override
  State<NotEligibleScreen> createState() => _NotEligibleScreenState();
}

class _NotEligibleScreenState extends State<NotEligibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: [
            Positioned(
                right: 20,
                top: 60,
                child: Image.asset(IconAssets.ic_close_with_white_bg)),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.toNamed(RoutesName.productDetailScreen);
                        },
                        child: SvgPicture.asset(ImageAssets.img_not_eligible),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(30),
                      ),
                      Text(
                        'sorry_you_are_not_eligible_right_now'.tr,
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.textBlack80Per,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
