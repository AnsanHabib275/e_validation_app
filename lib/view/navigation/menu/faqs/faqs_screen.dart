import 'package:e_validation/models/navigation/menu/faqs/faqs_list_model.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:e_validation/view/navigation/menu/faqs/widget/faqs_card_widget.dart';
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
  final List<FaqsListModel> faqsItems = [
    FaqsListModel(
      'what_are_the_benefits_of_points'.tr,
      'redeem_points'.tr,
      'redeem_points_description'.tr,
    ),
    FaqsListModel(
      'what_is_kyc'.tr,
      'know_your_customer'.tr,
      'kyc_description'.tr,
    ),
    FaqsListModel(
      'lorem_ipsum_is_simply_dummy_text'.tr,
      'simply_dummy_text'.tr,
      'lorem_ipsum_description'.tr,
    ),
    FaqsListModel(
      'generate_lorem_ipsum_which_looks_reasonable'.tr,
      'generate_lorem_ipsum'.tr,
      'generate_lorem_ipsum_description'.tr,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: Get.height * Utils.getResponsiveHeight(116)),
          child: FloatingActionButton.small(
            onPressed: () {
              Get.toNamed(RoutesName.voiceChatGptScreen);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    Get.height * Utils.getResponsiveSize(4))),
            backgroundColor: AppColor.underlineTextColor,
            child: SvgPicture.asset(
              IconAssets.ic_question,
            ),
          ),
        ),
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
                      ImageAssets.img_faqs,
                      height: Get.height * Utils.getResponsiveHeight(216),
                      width: Get.width * Utils.getResponsiveWidth(262),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(10)),
                    child: Text(
                      'frequently_asked_questions'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: Get.height * Utils.getResponsiveSize(26),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: Get.width * Utils.getResponsiveWidth(16),
                  right: Get.width * Utils.getResponsiveWidth(16),
                  // top: Get.height * Utils.getResponsiveHeight(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: faqsItems.length,
                  itemBuilder: (context, index) {
                    final faqs = faqsItems[index];
                    return FaqsCardWidget(faqs: faqs);
                  },
                ),
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.vertical,
                //   child: Column(
                //     children: [
                //       FaqsCardWidget(),
                //       // Card(
                //       //   elevation: 0,
                //       //   child: Padding(
                //       //     padding: const EdgeInsets.all(14.0),
                //       //     child: Row(
                //       //       mainAxisAlignment: MainAxisAlignment.center,
                //       //       children: [
                //       //         Expanded(
                //       //           child: Text(
                //       //             'what_are_the_benefits_of_points'.tr,
                //       //             style: TextStyle(
                //       //                 color: AppColor.textBlackPrimary,
                //       //                 fontSize: 13,
                //       //                 fontFamily: 'Poppins',
                //       //                 fontWeight: FontWeight.w400),
                //       //           ),
                //       //         ),
                //       //         Image.asset(
                //       //           IconAssets.ic_arrow_down,
                //       //           height: 24,
                //       //           width: 24,
                //       //         ),
                //       //       ],
                //       //     ),
                //       //   ),
                //       // ),
                //       SizedBox(
                //         height: 2,
                //       ),
                //       Card(
                //         elevation: 0,
                //         child: Padding(
                //           padding: const EdgeInsets.all(14.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Expanded(
                //                 child: Text(
                //                   'what_is_kyc'.tr,
                //                   style: TextStyle(
                //                       color: AppColor.textBlackPrimary,
                //                       fontSize: 13,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400),
                //                 ),
                //               ),
                //               Image.asset(
                //                 IconAssets.ic_arrow_down,
                //                 height: 24,
                //                 width: 24,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 2,
                //       ),
                //       Card(
                //         elevation: 0,
                //         child: Padding(
                //           padding: const EdgeInsets.all(14.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Expanded(
                //                 child: Text(
                //                   'lorem_ipsum_is_simply_dummy_text'.tr,
                //                   style: TextStyle(
                //                       color: AppColor.textBlackPrimary,
                //                       fontSize: 13,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400),
                //                 ),
                //               ),
                //               Image.asset(
                //                 IconAssets.ic_arrow_down,
                //                 height: 24,
                //                 width: 24,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 2,
                //       ),
                //       Card(
                //         elevation: 0,
                //         child: Padding(
                //           padding: const EdgeInsets.all(14.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Expanded(
                //                 child: Text(
                //                   'generate_lorem_ipsum_which_looks_reasonable'
                //                       .tr,
                //                   style: TextStyle(
                //                       color: AppColor.textBlackPrimary,
                //                       fontSize: 13,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400),
                //                 ),
                //               ),
                //               Image.asset(
                //                 IconAssets.ic_arrow_down,
                //                 height:
                //                     Get.height * Utils.getResponsiveHeight(24),
                //                 width: Get.width * Utils.getResponsiveWidth(24),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       right: Get.width * Utils.getResponsiveWidth(16),
            //       // top: Get.height * Utils.getResponsiveHeight(20),
            //       bottom: Get.height * Utils.getResponsiveHeight(96)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Spacer(),
            //       InkWell(
            //           onTap: () {
            //             Get.toNamed(RoutesName.voiceChatGptScreen);
            //           },
            //           child: SvgPicture.asset(
            //             IconAssets.ic_question_with_bg,
            //             height: Get.height * Utils.getResponsiveHeight(38),
            //             width: Get.width * Utils.getResponsiveWidth(36),
            //           ))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
