import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/icon_assets.dart';
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
                        fontFamily: 'Poppins',
fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'what_are_the_benefits_of_points'.tr,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
fontWeight: FontWeight.w400),
                              ),
                            ),
                            Image.asset(
                              IconAssets.ic_submitted_complaint,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'what_is_kyc'.tr,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
fontWeight: FontWeight.w400),
                              ),
                            ),
                            Image.asset(
                              IconAssets.ic_submitted_complaint,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'lorem_ipsum_is_simply_dummy_text'.tr,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
fontWeight: FontWeight.w400),
                              ),
                            ),
                            Image.asset(
                              IconAssets.ic_submitted_complaint,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'generate_lorem_ipsum_which_looks_reasonable'
                                    .tr,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
fontWeight: FontWeight.w400),
                              ),
                            ),
                            Image.asset(
                              IconAssets.ic_submitted_complaint,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Image.asset(IconAssets.ic_question_with_bg)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
