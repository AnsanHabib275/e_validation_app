import 'package:e_validation/models/navigation/menu/points/points_list_model.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/menu/points/widget/points_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/restaurants_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/transportation_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/section_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  final List<PointsListModel> entertainmentItems = [
    PointsListModel(ImageAssets.tp_1, 'movie ticket', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_2, 'concert ticket', 'Rs = 1000pkr'),
    PointsListModel(ImageAssets.tp_3, 'movie ticket', 'Rs = 200pkr'),
    PointsListModel(ImageAssets.tp_1, 'playland', 'Rs = 250pkr'),
    PointsListModel(ImageAssets.tp_2, 'movie ticket', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_3, 'concert ticket', 'Rs = 1000pkr'),
  ];
  final List<PointsListModel> restaurantsItems = [
    PointsListModel(ImageAssets.tp_1, 'restaurant name', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_2, 'restaurant name', 'Rs = 1000pkr'),
    PointsListModel(ImageAssets.tp_3, 'restaurant name', 'Rs = 200pkr'),
    PointsListModel(ImageAssets.tp_1, 'restaurant name', 'Rs = 250pkr'),
    PointsListModel(ImageAssets.tp_2, 'restaurant name', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_3, 'restaurant name', 'Rs = 1000pkr'),
  ];
  final List<PointsListModel> vouchersItems = [
    PointsListModel(ImageAssets.tp_1, 'discount card', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_2, 'discount card', 'Rs = 1000pkr'),
    PointsListModel(ImageAssets.tp_3, 'discount card', 'Rs = 200pkr'),
    PointsListModel(ImageAssets.tp_1, 'discount card', 'Rs = 250pkr'),
    PointsListModel(ImageAssets.tp_2, 'discount card', 'Rs = 500pkr'),
    PointsListModel(ImageAssets.tp_3, 'discount card', 'Rs = 1000pkr'),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: Get.height * Utils.getResponsiveHeight(270),
              width: Get.width * 1,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Expanded(
                      child: Image(
                        image: AssetImage(ImageAssets.product_detail_bg),
                        width: Get.width * Utils.getResponsiveWidth(428),
                        height: Get.height * Utils.getResponsiveHeight(219),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 124,
                      left: 16,
                      right: 16,
                      child: Card(
                        child: Container(
                          height: Get.height * Utils.getResponsiveHeight(219),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            // Container(
            //   width: Get.width * Utils.getResponsiveWidth(428),
            //   height: Get.height * Utils.getResponsiveHeight(219),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(ImageAssets.product_detail_bg),
            //       // Replace with your image path
            //       fit: BoxFit.cover, // Adjust the image to fill the screen
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         ImageAssets.img_redeem_reward,
            //         height: 193,
            //       ),
            //       SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
            //       Text(
            //         "redeem_your_rewards".tr,
            //         style: TextStyle(
            //             color: AppColor.textColorPrimary,
            //             fontSize: 26,
            //             fontFamily: FontAssets.poppins_semi_bold),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
            SectionHeader(title: 'entertainment'.tr),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
            PointsCardWidget(items: entertainmentItems),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
            SectionHeader(title: 'restaurants'.tr),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
            PointsCardWidget(items: restaurantsItems),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
            SectionHeader(title: 'vouchers'.tr),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
            PointsCardWidget(items: vouchersItems),
          ],
        ),
      ),
    );
  }
}