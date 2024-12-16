import 'package:e_validation/view/navigation/reward/widget/get_reward_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/assets/font_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(children: [
          Container(
            width: Get.width * Utils.getResponsiveWidth(428),
            height: Get.height * Utils.getResponsiveHeight(300),
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
                  ImageAssets.img_reward,
                  height: Get.height * Utils.getResponsiveHeight(193),
                  width: Get.width * Utils.getResponsiveWidth(235),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'rewards'.tr,
                  style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 26,
                      fontFamily: FontAssets.poppins_semi_bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageAssets
                                .reward_points_box), // Replace with your image path
                            fit: BoxFit
                                .cover, // Adjust the image to fill the screen
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '+180',
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_semi_bold,
                                    fontSize: 22),
                              ),
                              Text(
                                'points'.tr,
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_regular,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                      Text(
                        'products_scanned'.tr,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '56',
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
                Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageAssets
                                .reward_points_box), // Replace with your image path
                            fit: BoxFit
                                .cover, // Adjust the image to fill the screen
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '+20',
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_semi_bold,
                                    fontSize: 22),
                              ),
                              Text(
                                'points'.tr,
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_regular,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                      Text(
                        'complaints'.tr,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '23',
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
                Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageAssets
                                .reward_points_box), // Replace with your image path
                            fit: BoxFit
                                .cover, // Adjust the image to fill the screen
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '+40',
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_semi_bold,
                                    fontSize: 22),
                              ),
                              Text(
                                'points'.tr,
                                style: TextStyle(
                                    color: AppColor.textWhite,
                                    fontFamily: FontAssets.poppins_regular,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                      Text(
                        'solved_complaints'.tr,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '10',
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontFamily: FontAssets.poppins_medium,
                            fontSize: 18),
                      ),
                      SizedBox(
                          height: Get.width * Utils.getResponsiveWidth(16)),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(30)),
                GetRewardButtonWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
