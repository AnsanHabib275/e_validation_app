import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(461),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * Utils.getResponsiveHeight(136)),
                    child: SvgPicture.asset(
                      ImageAssets.img_kyc,
                      height: Get.height * Utils.getResponsiveHeight(216),
                      width: Get.width * Utils.getResponsiveWidth(262),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'know_your_customer'.tr,
                    style: TextStyle(
                        color: AppColor.textColorSecondary,
                        fontSize: Get.height * Utils.getResponsiveSize(26),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * Utils.getResponsiveHeight(20),
                  horizontal: Get.width * Utils.getResponsiveWidth(16)),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(14),
                      vertical: Get.height * Utils.getResponsiveHeight(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAssets.img_attach_document),
                      Text(
                        'upload_your_identity_card_front_and_back'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.textBlack80Per,
                            fontSize: Get.height * Utils.getResponsiveSize(16),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
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
