import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(365),
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
                        top: Get.height * Utils.getResponsiveHeight(98)),
                    child: CircleAvatar(
                      radius: Get.height * Utils.getResponsiveSize(73),
                      backgroundColor: AppColor.lightGreyColor,
                      backgroundImage: AssetImage(ImageAssets.dummy_profile),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(30),
                  ),
                  Text(
                    'George Oliver',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(20),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Georgeoliver@gmail.com',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColor.textGreyPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(16),
                  vertical: Get.height * Utils.getResponsiveHeight(20)),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.height * Utils.getResponsiveHeight(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            'george oliver',
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            'phone_number'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            '+92345789902',
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            'email'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            'georgeoliver@gmail.com',
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          // Text(
                          //   'gender'.tr,
                          //   style: TextStyle(
                          //       color: AppColor.textColorPrimary,
                          //       fontSize: 20,
                          //       fontFamily: 'Poppins',
                          //       fontWeight: FontWeight.w500),
                          // ),
                          // SizedBox(
                          //   height: Get.height * Utils.getResponsiveHeight(5),
                          // ),
                          // Text(
                          //   'Male',
                          //   style: TextStyle(
                          //       color: AppColor.textBlackPrimary,
                          //       fontSize: 16,
                          //       fontFamily: 'Poppins',
                          //       fontWeight: FontWeight.w400),
                          // ),
                          // SizedBox(
                          //   height: Get.height * Utils.getResponsiveHeight(12),
                          // ),
                          Text(
                            'date_of_birth'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            '10-26-2001',
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(IconAssets.ic_edit)
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
