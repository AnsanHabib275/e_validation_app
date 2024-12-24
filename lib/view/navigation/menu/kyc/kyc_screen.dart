import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              // width: Get.width * Utils.getResponsiveWidth(428),
              // height: Get.height * Utils.getResponsiveHeight(461),
              height: 401,
              width: Get.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.img_kyc,
                      height: Get.height * Utils.getResponsiveHeight(216),
                      width: Get.width * Utils.getResponsiveWidth(262),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'know_your_customer'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 26,
                          fontFamily: FontAssets.poppins_semi_bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAssets.img_attach_document),
                      Text(
                        'upload_your_identity_card_front_and_back'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 13,
                            fontFamily: FontAssets.poppins_regular),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
