import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({super.key});

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.img_faqs,
                    height: Get.height * Utils.getResponsiveHeight(216),
                    width: Get.width * Utils.getResponsiveWidth(262),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'frequently_asked_questions'.tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 26,
                        fontFamily: FontAssets.poppins_semi_bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'product_details'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 22,
                          fontFamily: FontAssets.poppins_semi_bold),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(8),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'product_name'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'barcode'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  '3425168789',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'product_sku'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  '24-mb04',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'supplier'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  'lorem ipsum',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'created_at'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  '10-24-2022',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'expiry_date'.tr,
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                                Spacer(),
                                Text(
                                  '10-24-2022',
                                  style: TextStyle(
                                      color: AppColor.textBlackPrimary,
                                      fontSize: 16,
                                      fontFamily: FontAssets.poppins_regular),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(63),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DoneButtonWidget(),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}