import 'package:e_validation/models/navigation/menu/points/points_list_model.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/menu/points/widget/custom_progress_bar.dart';
import 'package:e_validation/view/navigation/menu/points/widget/earn_more_button_widget.dart';
import 'package:e_validation/view/navigation/menu/points/widget/points_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/restaurants_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/transportation_card_widget.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/section_header.dart';
import 'package:e_validation/view/navigation/menu/vouchers/widget/vouchers_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../models/navigation/menu/vouchers/vouchers_list_model.dart';

class VouchersScreen extends StatefulWidget {
  const VouchersScreen({super.key});

  @override
  State<VouchersScreen> createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen> {
  late int earnPoints;
  late int totalPoints;
  late String redeemText;
  final List<VouchersListModel> vouchersItems = [
    VouchersListModel(
        ImageAssets.voucher_1,
        'Arcadian Cafe',
        'gift voucher',
        'specially for you',
        'this voucher entitles the holder to spend at resturant ',
        '200rs',
        '02348916473912',
        '28 june 2023'),
    VouchersListModel(
        ImageAssets.voucher_2,
        'freddy’s Cafe',
        'gift voucher',
        'specially for you',
        'this voucher entitles the holder to spend at resturant ',
        '500rs',
        '02348916473912',
        '28 june 2023'),
  ];

  @override
  Widget build(BuildContext context) {
    earnPoints = 5000;
    totalPoints = 10000;
    redeemText = 'you need $earnPoints pts more to redeem';
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
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
                    child: Container(
                      width: Get.width * Utils.getResponsiveWidth(428),
                      height: Get.height * Utils.getResponsiveHeight(219),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.product_detail_bg),
                          // Replace with your image path
                          fit: BoxFit
                              .cover, // Adjust the image to fill the screen
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 16,
                      right: 16,
                      child: Card(
                        child: Container(
                          height: Get.height * Utils.getResponsiveHeight(155),
                          width: Get.width * Utils.getResponsiveWidth(396),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ImageAssets.img_profile_dummy),
                                          radius: 32,
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            right: 0,
                                            child: Image.asset(
                                              IconAssets.ic_edit_image,
                                              width: 12,
                                              height: 12,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width *
                                          Utils.getResponsiveWidth(10),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name Here',
                                          style: TextStyle(
                                              color: AppColor.colorPrimary,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Lorem Ipsum',
                                          style: TextStyle(
                                              color: AppColor.textBlackPrimary,
                                              fontSize: 8,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      ImageAssets.img_points,
                                      width: 42,
                                      height: 40,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child:
                                            CustomProgressBar(progress: 0.5)),
                                    SizedBox(
                                      width: Get.width *
                                          Utils.getResponsiveWidth(8),
                                    ),
                                    Text(earnPoints.toString() +
                                        '/' +
                                        totalPoints.toString()),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'you need $earnPoints pts more to redeem'
                                          .toTitleCase(),
                                      style: TextStyle(
                                          color: AppColor.textBlackPrimary,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          fontSize: 10),
                                    ),
                                    Spacer(),
                                    EarnMoreButtonWidget(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
            // Text(
            //   'data',
            //   style: TextStyle(fontSize: 56),
            // )
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: vouchersItems.length,
                  itemBuilder: (context, index) {
                    final voucher = vouchersItems[index];
                    return VouchersCardWidget(items: voucher);
                  },
                ),
              ),
            ),
            // VouchersCardWidget(items: vouchersItems),
          ],
        ),
      ),
    );
  }
}
