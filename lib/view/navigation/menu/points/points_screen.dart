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
  late int earnPoints;
  late int totalPoints;
  late String redeemText;
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
    earnPoints = 5000;
    totalPoints = 10000;
    redeemText = 'you need $earnPoints pts more to redeem';
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack(
            //   children: [
            //     Positioned(
            //       width: Get.width * Utils.getResponsiveWidth(428),
            //       height: Get.height * Utils.getResponsiveHeight(219),
            //       top: 0,
            //       left: 0,
            //       right: 0,
            //       child: Container(
            //         // width: Get.width * Utils.getResponsiveWidth(428),
            //         // height: Get.height * Utils.getResponsiveHeight(219),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //               bottomLeft: Radius.circular(8),
            //               bottomRight: Radius.circular(8)),
            //           image: DecorationImage(
            //             image: AssetImage(ImageAssets.product_detail_bg),
            //             // Replace with your image path
            //             fit:
            //                 BoxFit.cover, // Adjust the image to fill the screen
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //         height: Get.height * Utils.getResponsiveHeight(155),
            //         width: Get.width * Utils.getResponsiveWidth(396),
            //         // bottom: 0,
            //         // top: 124,
            //         left: 16,
            //         right: 16,
            //         child: Card(
            //           child: Container(
            //             // height: Get.height * Utils.getResponsiveHeight(155),
            //             // width: Get.width * Utils.getResponsiveWidth(396),
            //             child: Padding(
            //               padding: const EdgeInsets.all(16.0),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: [
            //                       Stack(
            //                         children: [
            //                           CircleAvatar(
            //                             backgroundImage: AssetImage(
            //                                 ImageAssets.img_profile_dummy),
            //                             radius: 32,
            //                           ),
            //                           Positioned(
            //                               bottom: 10,
            //                               right: 0,
            //                               child: Image.asset(
            //                                 IconAssets.ic_edit_image,
            //                                 width: 12,
            //                                 height: 12,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(
            //                         width: Get.width *
            //                             Utils.getResponsiveWidth(10),
            //                       ),
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             'Name Here',
            //                             style: TextStyle(
            //                                 color: AppColor.colorPrimary,
            //                                 fontSize: 12,
            //                                 fontFamily: 'Poppins',
            //                                 fontWeight: FontWeight.w600),
            //                           ),
            //                           Text(
            //                             'Lorem Ipsum',
            //                             style: TextStyle(
            //                                 color: AppColor.textBlack80Per,
            //                                 fontSize: 8,
            //                                 fontFamily: 'Poppins',
            //                                 fontWeight: FontWeight.w400),
            //                           ),
            //                         ],
            //                       ),
            //                       Spacer(),
            //                       Image.asset(
            //                         ImageAssets.img_points,
            //                         width: 42,
            //                         height: 40,
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height:
            //                         Get.height * Utils.getResponsiveHeight(10),
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Expanded(
            //                           child: CustomProgressBar(progress: 0.5)),
            //                       SizedBox(
            //                         width:
            //                             Get.width * Utils.getResponsiveWidth(8),
            //                       ),
            //                       Text(earnPoints.toString() +
            //                           '/' +
            //                           totalPoints.toString()),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height:
            //                         Get.height * Utils.getResponsiveHeight(8),
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         'you need $earnPoints pts more to redeem'
            //                             .toTitleCase(),
            //                         style: TextStyle(
            //                             color: AppColor.textBlack80Per,
            //                             fontWeight: FontWeight.w400,
            //                             fontFamily: 'Poppins',
            //                             fontSize: 10),
            //                       ),
            //                       Spacer(),
            //                       EarnMoreButtonWidget(),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ))
            //   ],
            // ),
            Container(
              height: Get.height * Utils.getResponsiveHeight(289),
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
                      top: Get.height * Utils.getResponsiveHeight(124),
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
                                              color: AppColor.textBlack80Per,
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
                                          color: AppColor.textBlack80Per,
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
