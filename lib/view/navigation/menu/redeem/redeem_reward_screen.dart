import 'package:e_validation/models/navigation/menu/redeem/restaurants_list_model.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/restaurants_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/transportation_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/section_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../models/navigation/menu/redeem/transportation_list_model.dart';

class RedeemRewardScreen extends StatefulWidget {
  const RedeemRewardScreen({super.key});

  @override
  State<RedeemRewardScreen> createState() => _RedeemRewardScreenState();
}

class _RedeemRewardScreenState extends State<RedeemRewardScreen> {
  final List<TransportationListModel> transportationItems = [
    TransportationListModel(ImageAssets.tp_1,
        'Lorem Ipsum text ever since the 1500s', '12,000 VP', 'Redeem'),
    TransportationListModel(ImageAssets.tp_2,
        'Lorem Ipsum text ever since the 1500s', '10,000 VP', 'Redeem'),
    TransportationListModel(ImageAssets.tp_3,
        'Lorem Ipsum text ever since the 1500s', '12,000 VP', 'Redeem'),
    TransportationListModel(ImageAssets.tp_1,
        'Lorem Ipsum text ever since the 1500s', '12,000 VP', 'Redeem'),
    TransportationListModel(ImageAssets.tp_2,
        'Lorem Ipsum text ever since the 1500s', '10,000 VP', 'Redeem'),
    TransportationListModel(ImageAssets.tp_3,
        'Lorem Ipsum text ever since the 1500s', '12,000 VP', 'Redeem'),
  ];
  final List<RestaurantsListModel> restaurantsItems = [
    RestaurantsListModel(
        ImageAssets.tp_1, 'Lorem Ipsum text ever since the 1500s'),
    RestaurantsListModel(
        ImageAssets.tp_2, 'Lorem Ipsum text ever since the 1500s'),
    RestaurantsListModel(
        ImageAssets.tp_3, 'Lorem Ipsum text ever since the 1500s'),
    RestaurantsListModel(
        ImageAssets.tp_1, 'Lorem Ipsum text ever since the 1500s'),
    RestaurantsListModel(
        ImageAssets.tp_2, 'Lorem Ipsum text ever since the 1500s'),
    RestaurantsListModel(
        ImageAssets.tp_3, 'Lorem Ipsum text ever since the 1500s'),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(365),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.product_detail_bg),
                  // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * Utils.getResponsiveHeight(87)),
                    child: SvgPicture.asset(
                      ImageAssets.img_redeem_reward,
                      height: Get.height * Utils.getResponsiveHeight(193),
                      width: Get.width * Utils.getResponsiveWidth(235),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    "redeem_your_rewards".tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 150)),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 140, 136, 136),
                        highlightColor: const Color.fromARGB(69, 59, 108, 255),
                        child: const Text(
                          'Coming Soon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ]),
            )
            // SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
            // SectionHeader(title: 'transportation'.tr),
            // SizedBox(height: Get.height * Utils.getResponsiveHeight(10)),
            // TransportationCardWidget(items: transportationItems),
            // SizedBox(height: Get.height * Utils.getResponsiveHeight(10)),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Divider(
            //     height: 1,
            //     color: AppColor.textBlack6Per,
            //   ),
            // ),
            // SizedBox(height: Get.height * Utils.getResponsiveHeight(11)),
            // SectionHeader(title: 'restaurants'.tr),
            // SizedBox(height: Get.height * Utils.getResponsiveHeight(10)),
            // RestaurantsCardWidget(items: restaurantsItems),
          ],
        ),
      ),
    );
  }
}
